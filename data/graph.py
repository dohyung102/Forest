import pandas as pd
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# def recommend_plant(data, user_data):
#     plants = pd.DataFrame(data)
#     combine_index = ['watering', 'flower_presence', 'manage_difficulty', 'growth_rate', 'placement']
#     plants = plants[combine_index]
#     plants['placement'] = plants['placement'].apply(lambda x: x.replace(',', ' '))
#     plants['all_text'] = plants[combine_index].apply(lambda row: ' '.join(row.values.astype(str)), axis=1)

#     similarity = cosine_similarity(c_counter_vector, plant_vector)
#     plants['similarity'] = similarity

#     return plants.sort_values('similarity', ascending=False)[:10]

plants = pd.read_csv('./all_processed_plant_data.csv', encoding='cp949').fillna('no')
combine_index = ['watering', 'flower_presence', 'manage_difficulty', 'growth_rate', 'placement']
plants = plants[combine_index]
plants['placement'] = plants['placement'].apply(lambda x: x.replace(' ', ''))
plants['placement'] = plants['placement'].apply(lambda x: x.replace(',', ' '))
plants['all_text'] = plants[combine_index].apply(lambda row: ' '.join(row.values.astype(str)), axis=1)


counter_vector = CountVectorizer()
counter_vector.fit(plants['all_text'])
c_counter_vector = counter_vector.transform(plants['all_text']).toarray()
print(counter_vector.vocabulary_)

plant = plants.head(1)
plant_vector = counter_vector.transform(plant['all_text']).toarray()

similarity = cosine_similarity(c_counter_vector, plant_vector)
plants['similarity'] = similarity

result = plants.sort_values('similarity', ascending=False)[:10]
print(result)