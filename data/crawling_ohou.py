from selenium.webdriver.common.keys import Keys
from selenium import webdriver
from bs4 import BeautifulSoup
import pandas as pd
import requests
import time

keys = Keys()
base_url = "https://smartstore.naver.com/gapjone/products/2109268487?NaPm=ct%3Dl104infs%7Cci%3D9dda3a23fb4f11a6ae95c46e6075eb00f160924a%7Ctr%3Dslsl%7Csn%3D301154%7Chk%3D6b982b0525b64f5b676084d428ef57a90deaa0ee"

### 크롬 드라이버 경로 지정 하기 ###
driver = webdriver.Chrome('/Users/eunsol/project/ssafy_project/forest/data/chromedriver/chromedriver')
driver.implicitly_wait(3)
driver.get(base_url)
time.sleep(2)

# driver.find_element_by_css_selector('#REVIEW > div > div._2y6yIawL6t > div > div._1jXgNbFhaN > div.P2lQOfXTQL > ul > li:nth-child(1) > a')
# time.sleep(1)
driver.find_element_by_css_selector('#REVIEW > div > div._2y6yIawL6t > div > div._1jXgNbFhaN > div.WiSiiSdHv3 > ul > li:nth-child(2) > a').send_keys(keys.ENTER)
time.sleep(2)

### 다음 버튼 'a.fAUKm1ewwo._2Ar8-aEUTq' ###
next_btn = ['a:nth-child(2)', 'a:nth-child(3)', 'a:nth-child(4)', 'a:nth-child(5)', 'a:nth-child(6)', 'a:nth-child(7)', 
'a:nth-child(8)', 'a:nth-child(9)', 'a:nth-child(10)', 'a:nth-child(11)']
review_list = []

for pagenum in next_btn:
    driver.find_element_by_css_selector('#REVIEW > div > div._2y6yIawL6t > div > div.cv6id6JEkg > div > div > a:nth-child(2)').send_keys(keys.ENTER)
    time.sleep(2)

    html = driver.page_source
    soup = BeautifulSoup(html, "html.parser")
    reviews = soup.select('#REVIEW > div > div._2y6yIawL6t > div > div.cv6id6JEkg > ul > li')

    for review in reviews:
        r = {}
        r['star'] = review.select('div > div > div > div._1XNnRviOK8 > div > div._1YShY6EQ56 > div._1rZLm75kLm > div._37TlmH3OaI > div._2V6vMO_iLm > em')[0].text
        r['id'] = review.select('div > div > div > div._1XNnRviOK8 > div > div._1YShY6EQ56 > div._1rZLm75kLm > div._37TlmH3OaI > div._2FmJXrTVEX > strong')[0].text
        r['date'] = review.select('div > div > div > div._1XNnRviOK8 > div > div._1YShY6EQ56 > div._1rZLm75kLm > div._37TlmH3OaI > div._2FmJXrTVEX > span')[0].text
        r['select'] = review.select('div > div > div > div._1XNnRviOK8 > div > div._1YShY6EQ56 > div._1rZLm75kLm > div._37TlmH3OaI > div._14FigHP3K8 > div > button > span')[0].text
        r['content'] = review.select('div > div > div > div._1XNnRviOK8 > div > div._1YShY6EQ56 > div._19SE1Dnqkf > div > span')[0].text
        review_list.append(r)

print(review_list)
# r = requests.get(base_url)
# c = r.content
# data = BeautifulSoup(c, "html.parser")

# url = 'body > div.page > div > div.production-selling > div.production-selling__detail-wrap.container > div > div.production-selling__detail__content.col-12.col-lg-8 > div > section:nth-child(5)'

# items = data.select('body > div.page > div > div.production-selling > div.production-selling__detail-wrap.container')

# print(items)
# for item in items:
#     a = item.select_one('a').attrs['href']
#     print(a)
