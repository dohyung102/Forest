

import requests
import json
import xmltodict
import pandas as pd

plants = [['페페로미아 그라베올렌스', '204870'], ['산세베리아 ‘하니’', '204869'], ['미파', '204868'], ['벽어연', '204867'], ['입전봉', '204866'], ['사마로', '204865'], ['모난데스 폴리필라', '204864'], ['야로수', '204863'], ['수', '204862'], ['십이지권', '204861'], ['알로에', '204860'], 
['불야성', '204859'], ['자보', '204858'], ['상조', '204857'], ['자려전', '204856'], ['입전', '204855'], ['일레인', '204854'], ['홍미인', '204853'], ['성미인', '204852'], ['군작', '204851'], ['신화월', '204850'], ['무을녀', '204849'], ['우주목', '204848'], ['십자성', '204847'], 
['남십자성', '204846'], ['염자', '204845'], ['애성', '204844'], ['기천', '204843'], ['은전', '204842'], ['백로', '204841'], ['크라슐라 ‘다비드’', '204840'], ['크라슐라 ‘부다템플’', '204839'], ['적귀성', '204838'], ['화제', '204837'], ['복랑', '204836'], ['백미인', '204835'], ['웅동자', '204834'], ['월토이', '204833'], ['당인', '204832'], ['캐시미어바이올렛', '204831'], ['소인제', '204830'], ['유접곡', '204829'], ['흑법사(黑法師)', '204828'], ['홍용월', '204827'], ['그랍토페탈룸 멘도자', '204826'], ['그랍토베리아 ‘퍼플드림’', '204825'], ['흑괴리', '204824'], 
['그랍토베리아 ‘실버스타’', '204823'], ['그랍토베리아 ‘데비’', '204822'], ['백모단', '204821'], ['연봉', '204820'], ['에케베리아 ‘탱고’', '204819'], 
['에케베리아 ‘블루에뜨’', '204818'], ['에케베리아 ‘미니캐슬’', '204817'], ['에케베리아 톨루센시스', '204816'], ['에케베리아 ‘데저스스타’', '204815'], ['환엽홍사', '204814'], ['에케베리아 ‘릴리시아나’', '204813'], ['조몽', '204812'], ['구미리', '204811'], ['에케베리아 ‘글라우카’', '204810'], ['에케베리아 ‘톱시터비’', '204809'], ['대화금', '204808'], ['에케베리아 푸미라', '204807'], ['금황성', '204806'], ['라일락', '204805'], 
['양로', '204804'], ['샤비홍', '204803'], ['홍매화', '204802'], ['몰라코', '204801'], ['에케베리아 ‘라임앤칠리’', '204800'], ['먼로', '204799'], ['에케베리아 ‘미니벨’', '204798'], ['부용', '204797'], ['에케베리아 ‘라즈베리아이스’', '204796'], ['에케베리아 ‘도리스테일러’', '204795'], 
['정야', '204794'], ['에케베리아 ‘펀퀸’', '204793'], ['홍화장', '204792'], ['에케베리아 ‘치와와린제’', '204791'], ['에케베리아 ‘크리스마스’', '204790'], ['에케베리아 ‘레이디스핑거’', '204789'], ['에케베리아 ‘제이드포인트’', '204788'], ['핑크세도이데스', '204787'], ['천장금', '204786'], ['녹영', '204785'], ['바위솔', '204784'], ['세데베리아 ‘팡파레’', '204783'], ['세데베리아 ‘레티지아’', '204782'], ['홍옥', '204781'], ['을녀심', '204780'], ['옥주염', '204779'], ['황금세덤', '204778'], ['환엽송록', '204777'], ["세덤 '리틀잼'", '204776'], ["세덤 '라울'", '204775'], ['청옥', '204774']]

plants_detail_list = []
for plant in plants:
    # print(plant[1])
    res = requests.get(f'http://api.nongsaro.go.kr/service/dryGarden/dryGardenDtl?apiKey=202203049T5USJE5RIEGM7DV3L0W&cntntsNo={plant[1]}')
    # print(res)
    # soup = BeautifulSoup(res.content, 'xml')
    jsonString = json.dumps(xmltodict.parse(res.text), indent=4, ensure_ascii=False)
    jsontype = json.loads(jsonString)
    plant_detail = jsontype['response']['body']['item']  
    plants_detail_list.append(plant_detail)

df = pd.DataFrame(plants_detail_list)
df.to_csv('dry_plants_detail_all_csv')