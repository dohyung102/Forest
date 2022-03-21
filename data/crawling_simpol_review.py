from selenium import webdriver
from textwrap import indent
from bs4 import BeautifulSoup
import pandas as pd
import requests
import time

plants = ['목마가렛']
for plant in plants:
    plant_review = {
        'plant_name' : plant
    }
    base_url = "https://www.simpol.co.kr/front/"
    search_url = f'productsearch.php?s_from=top&s_check=prodname&search={plant}'
    r = requests.get(base_url + search_url)
    c = r.content
    data = BeautifulSoup(c, "html.parser")

    num_of_goods = data.select('li.fw.ml30')[0].text
    num_of_goods = int(num_of_goods[5:len(num_of_goods)-1])
    if num_of_goods:
        items = data.select('#lotteTitle0')
        for item in items:
            # print(plant)
            item_url_root = data.select_one('div.img > a').attrs['href']
            item_url = base_url + item_url_root + '#page2'
            item_data = requests.get(item_url)
            item_data_html = item_data.content
            item_data = BeautifulSoup(item_data_html, 'html.parser')
            print(item_data)

            # driver = webdriver.Chrome('/Users/multicampus/Desktop/ssafy project/pjt2-managefile/chromedriver')
            # driver.get(item_url)
            # item_data_html = driver.page_source
            # item_data = BeautifulSoup(item_data_html, 'html.parser')
            # print(item_data)

            # num_of_reivew = item_data.select('span.pr-review')
            # print(num_of_reivew)
            # if num_of_reivew:
            # reviews = item_data.select('#tbl_prd > tbody > tr')
            # print(reviews)
            # for review in reviews:
            #     print(review)
            #     # review_content = review.select('td.ta_l.txt_limit')[0].text
            #     # review_user = review.select('td:nth-child(2)')[0].text
            #     # num_of_star = review.select('td:nth-child(4)')
            #     # print(num_of_star)
            #     break
#tbl_prd > tbody > tr > td:nth-child(4)
            break