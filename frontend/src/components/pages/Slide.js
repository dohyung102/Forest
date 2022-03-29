import React from 'react';
import styled from 'styled-components';

export default function Slide({ img, currentslide }) {
  return (
    <span>
      <IMG src={img} />
      <ul>
        <p>이름 : {}</p>
        <p>필요 온도 : {}</p>
        <p>급수 주기 : {}</p>
        <p>태그 : {}</p>
      </ul>
    </span>
  );
}

const IMG = styled.img`
  width: 500px;
  height: 500px;
`;

const Container = styled.span`
  display: flex;
  direction: column;
`;