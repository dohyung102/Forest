from bs4 import BeautifulSoup
import pandas as pd
import requests
# import re

# item = ["산세베리아"]
# name = input()
base_url = "https://fuleaf.com/plants"
# url = "https://www.simpol.co.kr/front/productsearch.php?s_from=top&s_check=prodname&search=" + item[0]
# url = "https://www.simpol.co.kr/front/productsearch.php?s_from=top&s_check=prodname&search=" + name

r = requests.get(base_url)
c = r.content
data = BeautifulSoup(c, "html.parser")

items = data.select('#plants_list > ul > div')

plants_detail_list = []

for item in items:
    a = item.select_one('a').attrs['href']
    a = a.split('/')[3]
    url = base_url + "/detail/" + a
    print(url)

    r = requests.get(url)
    c = r.content
    data = BeautifulSoup(c, "html.parser")

    # 식물 이름 관련
    plant_english_name = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-title > h1')[0].text
    plant_name = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-title > h2')[0].text
    plant_info = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-title > h3')[0].text

    plant_water = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-table > ul > div:nth-child(1) > li:nth-child(1) > h1')[0].text
    plant_water_info = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-table > ul > div:nth-child(1) > li:nth-child(1) > h2')[0].text

    plant_req_sun = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-table > ul > div:nth-child(1) > li:nth-child(2) > h1')[0].text
    plant_req_sun_info = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-table > ul > div:nth-child(1) > li:nth-child(2) > h2')[0].text

    plant_humidity = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-table > ul > div:nth-child(2) > li:nth-child(1) > h1')[0].text
    plant_humidity_info = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-table > ul > div:nth-child(2) > li:nth-child(1) > h2')[0].text

    plant_bne_title = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-table > ul > div:nth-child(2) > li:nth-child(2) > h1')[0].text
    plant_bne = data.select('#plantDetail__page > div > section.plants-simpleinfo-section > div.simpleinfo-table > ul > div:nth-child(2) > li:nth-child(2) > h2')[0].text

    raise_l = data.select('#plantDetail__page > section.plants-raise-section > ul > li:nth-child(1) > h1')[0].text
    raise_ld = data.select('#plantDetail__page > section.plants-raise-section > ul > li:nth-child(1) > h2')[0].text

    raise_t = data.select('#plantDetail__page > section.plants-raise-section > ul > li:nth-child(2) > h1')[0].text
    raise_td = data.select('#plantDetail__page > section.plants-raise-section > ul > li:nth-child(2) > h2')[0].text

    raise_h = data.select('#plantDetail__page > section.plants-raise-section > ul > li:nth-child(3) > h1')[0].text
    raise_hd = data.select('#plantDetail__page > section.plants-raise-section > ul > li:nth-child(3) > h2')[0].text

    raise_w = data.select('#plantDetail__page > section.plants-raise-section > ul > li:nth-child(4) > h1')[0].text
    raise_wd = data.select('#plantDetail__page > section.plants-raise-section > ul > li:nth-child(4) > h2')[0].text

    raise_s = data.select('#plantDetail__page > section.plants-raise-section > ul > li:nth-child(5) > h1')[0].text
    raise_sd = data.select('#plantDetail__page > section.plants-raise-section > ul > li:nth-child(5) > h2')[0].text

    plants_detail = {
        'plant_english_name': plant_english_name,
        'plant_name': plant_name,
        'plant_info': plant_info,
        'plant_water': plant_water_info,
        'plant_req_sun': plant_req_sun_info,
        'plant_humidity': plant_humidity_info,
        'plant_bne': plant_bne,
        'raise_l': raise_l,
        'raise_ld': raise_ld,
        'raise_h': raise_h,
        'raise_hd': raise_hd,
        'raise_w': raise_w,
        'raise_wd': raise_wd,
        'raise_s': raise_s,
        'raise_sd': raise_sd,
    }

    solutions = data.select('#plantDetail__page > section.plants-sos-section > div.sos-desc > ul > li')
    
    for idx, sos in enumerate(solutions):
        sos_title = sos.select('div.sos-item-title > h3')[0].text
        sos_dec = sos.select('div.sos-item-desc > h3.height-real')[0].text

        plants_detail['sos_title' + str(idx)] = sos_title
        plants_detail['sos_dec' + str(idx)] = sos_dec

    plants_detail_list .append(plants_detail)

df = pd.DataFrame(plants_detail_list)
df.to_csv('fuleaf_plants_detail.csv', encoding='utf-8-sig')
# items = data.select('#lotteTitle0')
# for item in items:
#   price = item.select('div.goods_price > strong')[0].get_text()
#   print(price)
# price = data.select_one('#lotteTitle0 > div.goods_price > strong')
# print(len(items))