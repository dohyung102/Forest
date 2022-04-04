import React from 'react';
// import styled from 'styled-components';
import './Survey.css'

const Survey = () => {
  return (
    <div>
      <h1>선호하는 환경을 입력해주세요</h1>
      <h3>관리 난이도</h3>
      <button>쉬워요</button>
      &nbsp;&nbsp;
      <button>어려워요</button>


      <h3>꽃 유무</h3>
      <button>있었으면 좋겠어요</button>
      &nbsp;&nbsp;
      <button>없는 게 좋아요</button>
      &nbsp;&nbsp;
      <button>상관없어요</button>

      <h3>성장 속도</h3>
      <button>느려요</button>
      &nbsp;&nbsp;
      <button>빨라요</button>

      <h3>크기</h3>
      <button>작아요</button>
      &nbsp;&nbsp;
      <button>적당해요</button>
      &nbsp;&nbsp;
      <button>커요</button>
      <br></br><br></br><br></br><br></br>
      <p>
        <button>취소</button>
        <button>확인</button>
      </p>
    </div>
  )
}

export default Survey;