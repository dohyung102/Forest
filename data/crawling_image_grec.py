from bs4 import BeautifulSoup
import pandas as pd
import requests
import urllib.request

base_url = 'https://greg.app/plant-care/'

r = requests.get(base_url)
c = r.content
data = BeautifulSoup(c, "html.parser")

items = data.select('#most-popular > ol > li')

plants_detail_list = []
for item in items:
    url = item.select_one('a > img').attrs['src']
    plant_name = item.select('a > h3')[0].text
    urllib.request.urlretrieve(url, f'{plant_name}.jpg')