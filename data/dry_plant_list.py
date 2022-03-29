from base64 import encode
from encodings import utf_8
import encodings
from urllib import response
import requests
from bs4 import BeautifulSoup
import json
import xmltodict

plants = []
for i in range(1, 11):
    res = requests.get(f'http://api.nongsaro.go.kr/service/dryGarden/dryGardenList?apiKey=202203049T5USJE5RIEGM7DV3L0W&pageNo={i}')
    # print(res)
    # soup = BeautifulSoup(res.content, 'xml')
    jsonString = json.dumps(xmltodict.parse(res.text), indent=4, ensure_ascii=False)
    jsontype = json.loads(jsonString)
    # print(type(jsonString))

    items = jsontype['response']['body']['items']['item']
    for item in items:
        plants.append([item['cntntsSj'], item['cntntsNo']])
        import urllib.request
        url = item['imgUrl1']
        plant_name = item['cntntsSj']
        urllib.request.urlretrieve(url, f'{plant_name}.jpg')
    
print(plants)