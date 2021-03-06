import os
import pandas as pd
from django.contrib.auth import get_user_model
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from .models import Plant
from accounts.models import Preference

BASE_DATA_DIR = 'plant/data'
PLANT_VECTOR_DATA = os.path.join(BASE_DATA_DIR, 'plants_vector_data.pkl')
FEATURE_NAMES = os.path.join(BASE_DATA_DIR, 'feature_names.pkl')
COSINE_SIMILARITY_PLANT_VECTOR_DATA = os.path.join(BASE_DATA_DIR, 'cosine_similarity_plant_vector_data.pkl')
USER_PREFERENCE_PLANT_VECTOR_DATA = os.path.join(BASE_DATA_DIR, 'user_preference_plant_vector_data.pkl')

def similar_plant_calculate():
    plants_vectorized_data = pd.read_pickle(PLANT_VECTOR_DATA)
    simiarity = cosine_similarity(plants_vectorized_data, plants_vectorized_data)
    # print(simiarity)
    pd.to_pickle(simiarity, COSINE_SIMILARITY_PLANT_VECTOR_DATA)


def plants_data_vectorization():
    plants = Plant.objects.values()
    plants_data = pd.DataFrame(plants).fillna('no')
    # plants_data = pd.read_csv(BASE_DATA_DIR + '/all_processed_plant_data.csv', encoding='cp949').fillna('no')
    combine_index = ['watering', 'flower_presence', 'manage_difficulty', 'growth_rate', 'placement']
    plants = plants_data[combine_index]
    plants['all_text'] = plants[combine_index].apply(lambda row: ' '.join(row.values.astype(str)), axis=1)
    
    counter_vector = CountVectorizer()
    counter_vector.fit(plants['all_text'])
    plants_vector = counter_vector.transform(plants['all_text']).toarray()
    feature_names = counter_vector.get_feature_names()
    # print(plants_vector)

    pd.to_pickle(plants_vector, PLANT_VECTOR_DATA)
    pd.to_pickle(feature_names, FEATURE_NAMES)

    similar_plant_calculate()

# plants_data_vectorization()
# similar_plant_calculate()
def find_similar_plant_by_plant_id(plant_id):
    plants = Plant.objects.values()
    plants_data = pd.DataFrame(plants).fillna('no')
    # plants_data = pd.read_csv(BASE_DATA_DIR + '/all_processed_plant_data.csv', encoding='cp949').fillna('no')
    plants_vector_data = pd.read_pickle(COSINE_SIMILARITY_PLANT_VECTOR_DATA)
    plant_index = plants_data[plants_data['id'] == plant_id].index.values
    if plant_index.size > 0:
        similar_plants_vector_data = plants_vector_data[plant_index[0]]
    else:
        return []
    plants_data['similarity'] = similar_plants_vector_data
    plants_data = plants_data[plants_data['id'] != plant_id]
    result = plants_data.sort_values('similarity', ascending=False)[:10]
    # print(len(result))
    result_dict = result.to_dict('records')
    return result_dict


def calculate_recommend_plants_by_user_preference(preference_data):
    data_dict = {
        'watering' : ['?????? ?????? ???????????? ?????????(?????? ??????)', '?????? ??? ????????? ???????????? ????????? ?????????', '?????? ????????? ???????????? ????????? ?????????', '?????? ????????? ???????????? ????????? ?????? ???????????? ?????????', '?????? ???????????? ?????????(?????? ????????? ????????? ??????)'],
        'flower_presence' : ['N', 'Y'],
        'manage_difficulty' : ['??????', '??????', '?????????', '?????? ?????????'],
        'growth_rate' : ['??????', '??????', '??????'],
        'placement' : ['?????? ?????? (???????????? 300~500cm)', '?????? ?????? (???????????? 150~300cm)', '????????? ?????? (???????????? 50~150cm)', '????????? ?????? (???????????? 0~50cm)']
    }
    all_text = ''
    combine_index = ['watering', 'flower_presence', 'manage_difficulty', 'growth_rate', 'placement']
    for index in combine_index:
        integer_list = list(preference_data[index].split(','))
        for i in integer_list:
            all_text += data_dict[index][int(i)] + ' '

    feature_names = pd.read_pickle(FEATURE_NAMES)
    counter_vector = CountVectorizer(vocabulary=feature_names)
    user_preference_vector = counter_vector.transform([all_text]).toarray()
    plants_vecter_data = pd.read_pickle(PLANT_VECTOR_DATA)
    similarity = cosine_similarity(plants_vecter_data, user_preference_vector)

    plants_data = pd.read_csv(BASE_DATA_DIR + '/all_processed_plant_data.csv', encoding='cp949').fillna('no')
    plants_data['similarity'] = similarity
    result = plants_data.sort_values('similarity', ascending=False)[:10]
    id_list = result['id'].to_list()
    print(id_list)
    user_preference_vector = pd.read_pickle(USER_PREFERENCE_PLANT_VECTOR_DATA)
    start_index = len(user_preference_vector)
    user_preference_vector = pd.concat([user_preference_vector, result], ignore_index=True)
    pd.to_pickle(user_preference_vector, USER_PREFERENCE_PLANT_VECTOR_DATA)
    return (start_index, id_list)

def find_preference_plants_by_index(index):
    user_preference_vector = pd.read_pickle(USER_PREFERENCE_PLANT_VECTOR_DATA)
    user_preference_vector = user_preference_vector[index:index+10]
    result_dict = user_preference_vector.to_dict('records')
    return result_dict


user_click_data = open('logs/user_call_data')
#???????????? ??????????????? list???????????? ??????
logdata = user_click_data.readlines()
num = len(logdata)
filedata = [0 for _ in range(num)]
for i in range(num):
    #user_id???????????? ????????? ??????
    a = logdata[i].index('user_id')
    sample = logdata[i][a:]
    sample = sample.split()
    filedata[i] = [int(sample[2][:-1]), int(sample[5])]
column_name = ['user_id', 'flant_id']
df = pd.DataFrame.from_records(filedata, columns=column_name)
print(df)

plants = Plant.objects.all()
plants_num = plants.count()
plant_cnt = [0 for _ in range(plants_num+1)]


def find_user_data_based_plants_by_user_id(user_id):
    user = Preference.objects.get(id=user_id)
    other_users = Preference.objects.filter(
        watering=user.watering, 
        flower_presence=user.flower_presence, 
        manage_difficulty=user.manage_difficulty, 
        growth_rate=user.growth_rate,
        placement=user.placement,
        ).values_list('id', flat=True)
    # ids = other_users.user_id
    for i in range(len(filedata)):
        if filedata[i][0] in other_users:
            plant_cnt[filedata[i][1]] += 1
    sortfile = sorted(filedata)
    n = len(sortfile)
    if n > 5:
        n = 5
    recomm_plant = []
    for j in range(n):
        recomm_plant.append(filedata.index(sortfile[j]))
    # print(Plant.objects.filter(id__in=recomm_plant))
    return Plant.objects.filter(id__in=recomm_plant)


# friend_list = [
#     ['john', 25, 'student'],
#     ['mi', 24, 'student'],
#     ['ma', 25, 'student'],
#     ['me', 27, 'student'],
#     ['jane', 30, 'teacher'],
#     ['nate', 30, 'developer'],
# ]
# column_name = ['name', 'age', 'job']
# df = pd.DataFrame.from_records(friend_list, columns=column_name)
# print(df)


# plants_data_vectorization()
