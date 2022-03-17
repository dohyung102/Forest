from bs4 import BeautifulSoup
import pandas as pd
import requests

base_url = "https://ohou.se/exhibitions/1645?affect_type=StoreSearchResult&affect_id=1"

r = requests.get(base_url)
c = r.content
data = BeautifulSoup(c, "html.parser")

print(data)