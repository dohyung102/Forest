import os
import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity

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
    plants_data = pd.read_csv(BASE_DATA_DIR + '/all_processed_plant_data.csv', encoding='cp949').fillna('no')
    combine_index = ['watering', 'flower_presence', 'manage_difficulty', 'growth_rate', 'placement']
    plants = plants_data[combine_index]
    plants['all_text'] = plants[combine_index].apply(lambda row: ' '.join(row.values.astype(str)), axis=1)
    
    counter_vector = CountVectorizer()
    counter_vector.fit(plants['all_text'])
    plants_vector = counter_vector.transform(plants['all_text']).toarray()
    feature_names = counter_vector.get_feature_names()

    pd.to_pickle(plants_vector, PLANT_VECTOR_DATA)
    pd.to_pickle(feature_names, FEATURE_NAMES)

    similar_plant_calculate()

# plants_data_vectorization()
# similar_plant_calculate()
def find_similar_plant_by_plant_id(plant_id):
    plants_data = pd.read_csv(BASE_DATA_DIR + '/all_processed_plant_data.csv', encoding='cp949').fillna('no')
    plants_vector_data = pd.read_pickle(COSINE_SIMILARITY_PLANT_VECTOR_DATA)
    plant_index = plants_data[plants_data['id'] == plant_id].index.values

    similar_plants_vector_data = plants_vector_data[plant_index[0]]
    plants_data['similarity'] = similar_plants_vector_data
    plants_data = plants_data[plants_data['id'] != plant_id]
    result = plants_data.sort_values('similarity', ascending=False)[:10]
    # print(len(result))
    result_dict = result.to_dict('records')
    # return result_dict
    return result_dict

def calculate_recommend_plants_by_user_preference(preference_data):
    data_dict = {
        'watering' : ['항상 흙을 축축하게 유지함(물에 잠김)', '화분 흙 대부분 말랐을때 충분히 관수함', '토양 표면이 말랐을때 충분히 관수함', '토양 표면이 말랐을때 표면이 젖을 정도로만 관수함', '흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)'],
        'flower_presence' : ['N', 'Y'],
        'manage_difficulty' : ['쉬움', '보통', '어려움', '매우 어려움'],
        'growth_rate' : ['느림', '보통', '빠름'],
        'placement' : ['거실 내측 (실내깊이 300~500cm)', '거실 창측 (실내깊이 150~300cm)', '발코니 내측 (실내깊이 50~150cm)', '발코니 창측 (실내깊이 0~50cm)']
    }
    all_text = ''
    combine_index = ['watering', 'flower_presence', 'manage_difficulty', 'growth_rate', 'placement']
    for index in combine_index:
        integer_list = list(preference_data[index].split(','))
        for i in integer_list:
            all_text += data_dict[index][i]

    feature_names = pd.read_pickle(FEATURE_NAMES)
    counter_vector = CountVectorizer(vocabulary=feature_names)
    user_preference_vector = counter_vector.transform(all_text).toarray()

    plants_vecter_data = pd.read_pickle(PLANT_VECTOR_DATA)
    similarity = cosine_similarity(plants_vecter_data, user_preference_vector)

    plants_data = pd.read_csv(BASE_DATA_DIR + '/all_processed_plant_data.csv', encoding='cp949').fillna('no')
    plants_data['similarity'] = similarity
    result = plants_data.sort_values('similarity', ascending=False)[:10]

    user_preference_vector = pd.read_pickle(USER_PREFERENCE_PLANT_VECTOR_DATA)
    start_index = len(user_preference_vector)
    user_preference_vector = pd.concat([user_preference_vector, result], ignore_index=True)
    return start_index

def find_preference_plants_by_index(index):
    user_preference_vector = pd.read_pickle(USER_PREFERENCE_PLANT_VECTOR_DATA)
    user_preference_vector = user_preference_vector[index:index+10]
    result_dict = user_preference_vector.to_dict('records')
    return result_dict


# user_click_data = open('forest/logs/user_call_data.log')
# print(user_click_data.readlines())
