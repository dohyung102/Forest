from selenium import webdriver
from bs4 import BeautifulSoup
import pandas as pd
import requests
import time

base_url = "https://ohou.se/productions/774861/selling?affect_type=ProductCategoryIndex&affect_id="
driver = webdriver.Chrome('/Users/eunsol/project/ssafy_project/forest/data/chromedriver/chromedriver')
driver.implicitly_wait(3)
driver.get(base_url)

time.sleep(3)
# r = requests.get(base_url)
# c = r.content
# data = BeautifulSoup(c, "html.parser")

# url = 'body > div.page > div > div.production-selling > div.production-selling__detail-wrap.container > div > div.production-selling__detail__content.col-12.col-lg-8 > div > section:nth-child(5)'

# items = data.select('body > div.page > div > div.production-selling > div.production-selling__detail-wrap.container')

# print(items)
# for item in items:
#     a = item.select_one('a').attrs['href']
#     print(a)