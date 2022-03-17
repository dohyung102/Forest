from bs4 import BeautifulSoup
import pandas as pd
import requests

base_url = 'https://greg.app/plant-care/'

r = requests.get(base_url)
c = r.content
data = BeautifulSoup(c, "html.parser")

items = data.select('#most-popular > ol > li')

plants_detail_list = []

for item in items:
    url = item.select_one('a').attrs['href']
    r = requests.get(url)
    c = r.content
    data = BeautifulSoup(c, "html.parser")
    
    plant_english_name = data.select('#main-content > article > div > section > h1')[0].text
    plant_infos = data.select('#main-content > article > div > section > div.mt-7.px-6.editorial > p')
    if plant_infos:
        plant_infos = plant_infos[0].text
    else:
        plant_infos = ''
    
    plant_water_need = data.select('#water-section > div.px-6.pb-6.text-lg.flex.flex-row.flex-wrap.sm\:flex-nowrap > div > p:nth-child(1)')[0].text

    plant_light_need = data.select('#light-section > section:nth-child(2) > div > div > p')[0].text

    plant_fertilizer_need = data.select('#nutrients-section > section > div > div > p')[0].text

    plant_defficulty_level = data.select('#faqs-difficulty-level-subsection > p')
    if plant_defficulty_level:
        plant_defficulty_level = plant_defficulty_level[0].text
    else:
        plant_defficulty_level = ''

    plant_water_Needs = data.select('#faqs-water-needs-subsection > p')
    if plant_water_Needs:
        plant_water_Needs = plant_water_Needs[0].text
    else:
        plant_water_Needs = ''

    plant_sunlight_needs = data.select('#faqs-sunlight-needs-subsection > p')
    if plant_sunlight_needs:
        plant_sunlight_needs = plant_sunlight_needs[0].text
    else:
        plant_sunlight_needs = ''

    plant_toxicity = data.select('#faqs-toxicity-subsection > p')
    if plant_toxicity:
        plant_toxicity = plant_toxicity[0].text
    else:
        plant_toxicity = ''

    plant_humidity = data.select('#faqs-humidity-subsection > p')
    if plant_humidity:
        plant_humidity = plant_humidity[0].text
    else:
        plant_humidity = ''

    plant_soil = data.select('#faqs-soil-subsection > p')
    if plant_soil:
        plant_soil = plant_soil[0].text
    else:
        plant_soil = ''

    plant_dormancy = data.select('#faqs-dormancy-subsection > p.pb-4.pt-4')
    if plant_dormancy:
        plant_dormancy = plant_dormancy[0].text
    else:
        plant_dormancy = ''

    plant_flower = data.select('#faqs-flower-subsection > p')
    if plant_flower:
        plant_flower = plant_flower[0].text
    else:
        plant_flower = ''

    plant_growth_pattern = data.select('#faqs-growth-pattern-subsection > p')
    if plant_growth_pattern:
        plant_growth_pattern = plant_growth_pattern[0].text
    else:
        plant_growth_pattern = ''

    plant_yellow_leaves = data.select('#faqs-yellow-leaves-subsection')
    if plant_yellow_leaves:
        plant_yellow_leaves = plant_yellow_leaves[0].text
    else:
        plant_yellow_leaves = ''

    plant_common_issues = data.select('#faqs-common-issues-subsection')
    if plant_common_issues:
        plant_common_issues = plant_common_issues[0].text
    else:
        plant_common_issues = ''

    # plant = data.select('')[0].text
    plants_detail = {
        'plant_english_name': plant_english_name,
        'plant_infos': plant_infos,
        'plant_water_need': plant_water_need,
        'plant_light_need': plant_light_need,
        'plant_fertilizer_need': plant_fertilizer_need,
        'plant_defficulty_level': plant_defficulty_level,
        'plant_water_Needs': plant_water_Needs,
        'plant_sunlight_needs': plant_sunlight_needs,
        'plant_toxicity': plant_toxicity,
        'plant_humidity': plant_humidity,
        'plant_soil': plant_soil,
        'plant_dormancy': plant_dormancy,
        'plant_flower': plant_flower,
        'plant_growth_pattern': plant_growth_pattern,
        'plant_common_issues': plant_common_issues,
        'plant_yellow_leaves': plant_yellow_leaves
    }
    # if data.select('#faqs-yellow-leaves-subsection')[0].text:
    #     plant_yellow_leaves = data.select('#faqs-yellow-leaves-subsection')[0].text
    #     plants_detail['plant_yellow_leaves'] = plant_yellow_leaves

    # if data.select('#faqs-common-issues-subsection')[0].text:
    #     plant_common_issues = data.select('#faqs-common-issues-subsection')[0].text
    #     plants_detail['plant_common_issues'] = plant_common_issues

    plants_detail_list.append(plants_detail)


df = pd.DataFrame(plants_detail_list)
df.to_csv('grec_plants_detail.csv', encoding='utf-8-sig')