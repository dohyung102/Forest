import matplotlib.pyplot as plt
import os
import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity

BASE_DATA_DIR = 'plant/data'

def difficulty_vs_watering():
    plants_data = pd.read_csv(BASE_DATA_DIR + '/all_processed_plant_data.csv', encoding='cp949').fillna('no')
    watering = ['토양 표면이 말랐을때 충분히 관수함', '흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)', '토양 표면이 말랐을때 표면이 젖을 정도로만 관수함', '항상 흙을 축축하게 유지함(물에 잠김)', '화분 흙 대부분 말랐을때 충분히 관수함']
    flower_presence = ['Y', 'N']
    manage_difficulty = ['쉬움', '보통', '어려움', '매우 어려움']
    growth_rate = ['느림', '보통', '빠름']
    placement = ['거실 내측 (실내깊이 300~500cm)', '거실 창측 (실내깊이 150~300cm)', '발코니 내측 (실내깊이 50~150cm)', '발코니 창측 (실내깊이 0~50cm)']
    watering_dict = {
        '토양 표면이 말랐을때 충분히 관수함' : 1, 
        '흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)' : 2, 
        '토양 표면이 말랐을때 표면이 젖을 정도로만 관수함' : 3, 
        '항상 흙을 축축하게 유지함(물에 잠김)' : 4, 
        '화분 흙 대부분 말랐을때 충분히 관수함' : 5,
        'no' : 6
    }
    difficulty_dict = {
        '쉬움' : 1, 
        '보통' : 2, 
        '어려움' : 3, 
        '매우 어려움' : 4,
        'no' : 5
    }
    watering_data = plants_data['watering']
    watering_list = []
    for data in watering_data:
        watering_list.append(watering_dict[data])
    # print(watering_data)
    difficulty_data = plants_data['manage_difficulty']
    difficulty_list = []
    for data in difficulty_data:
        difficulty_list.append(difficulty_dict[data])
    # print(difficulty_data)
    zip_data = list(zip(difficulty_list, watering_list))
    x = []
    y = []
    area = []
    for i in range(1, 5):
        for j in range(1, 6):
            x.append(i)
            y.append(j)
            area.append(zip_data.count((i, j)))

    plt.scatter(x, y, s=area)
    plt.axis([0, 6, 0, 7])
    plt.show()

difficulty_vs_watering()