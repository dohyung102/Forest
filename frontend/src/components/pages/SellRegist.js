import React, { useState } from 'react';
import Calendar from 'react-calendar';
import moment from 'moment';
import 'moment/locale/ko';
import './SellRegist.css'

const SellRegist = () => {
  

  const [value, onChange] = useState(new Date());
      
      
    return (
      <div className='sell'>
        <div className='sellButton'>
          <button>상품 등록</button>
        </div>
        <div className='sellInfo'>
          <h2>기본 정보</h2>
          <div className='category'>
            <span>카테고리 </span>
            <button>목록</button>
          </div>

          <br />

          <div className='revealName'>
            <span>노출 상품명 </span>
            <input type='text'></input>
          </div>

          <br />

          <div className='registName'>
            <span>등록 상품명 </span>
            <input type='text'></input>
          </div>

          <br />

          <div className='storeName'>
            <span>판매처 </span>
            <input type='text'></input>
          </div>

          <br />

          <div className='sellDate'>
            <span>판매기간 </span>
            <Calendar onChange={onChange} value={value} />
            <div className="text-gray-500 mt-4">
              {moment(value).format("YYYY년 MM월 DD일")} d
            </div>
          </div>

          <br />

          <div className='price'>
            <span>가격 </span>
            <input type='text'></input>
          </div>
          
          <br />

          <div className='options'>
            <span>추가옵션</span>
          </div>
          
          <br /><br /><br /><br />
          <hr />
          <h2>상세 설명</h2>
          <form>
            <input name="content" />
          </form>
        </div>
      </div>
    )
  }
// }
export default SellRegist;