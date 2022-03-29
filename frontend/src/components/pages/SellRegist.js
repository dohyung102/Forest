import React from 'react';
import './SellRegist.css'

const SellRegist = () => {
  return (
    <div className='sell'>
      <div className='sellButton'>
        <button>상품 등록</button>
      </div>
      <div className='sellInfo'>
        <h2>기본 정보</h2>
        <p>카테고리 </p>
        <p>노출 상품명 </p>
        <p>등록 상품명 </p>
        <p>판매처 </p>
        <p>판매기간 </p>

        <br /><br /><br /><br />
        <hr />
        <h2>상세 설명</h2>
      </div>
    </div>
  )
}

export default SellRegist;