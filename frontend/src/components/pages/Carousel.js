import React, { useEffect, useRef, useState } from 'react';
import styled from 'styled-components';
import Slide from './Slide';
import img1 from './img/1.jpg';
import img2 from './img/2.jpg';
import img3 from './img/3.jpeg';

const TOTAL_SLIDES = 2; // 전체 슬라이드 개수(총3개. 배열로 계산)

export default function Slider() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const slideRef = useRef(null);



  // Next 버튼 클릭 시
  const NextSlide = () => {
    if (currentSlide >= TOTAL_SLIDES) {
      // 더 이상 넘어갈 슬라이드가 없으면
      setCurrentSlide(0); // 1번째 사진으로 넘어갑니다.
      // return;  // 클릭이 작동하지 않습니다.
    } else {
      setCurrentSlide(currentSlide + 1);
    }
  };
  // Prev 버튼 클릭 시
  const PrevSlide = () => {
    if (currentSlide === 0) {
      setCurrentSlide(TOTAL_SLIDES); // 마지막 사진으로 넘어갑니다.
      // return;  // 클릭이 작동하지 않습니다.
    } else {
      setCurrentSlide(currentSlide - 1);
    }
  };

  useEffect(() => {
    slideRef.current.style.transition = 'all 0.5s ease-in-out';
    slideRef.current.style.transform = `translateX(-${currentSlide}00%)`; // 백틱을 사용하여 슬라이드로 이동하는 에니메이션을 만듭니다.
  }, [currentSlide]);


  return (
    <Container>
      <Text>
        <h1>FOREST가 추천합니다!</h1>
        <p>Best {currentSlide + 1}</p>
      </Text>
      <SliderContainer ref={slideRef}>
        <Slide img={img1} />
        <Slide img={img2} />
        <Slide img={img3} />
      </SliderContainer>
      <Center>
        <Button onClick={PrevSlide}>이전</Button>
        <Button onClick={NextSlide}>다음</Button>
      </Center>
    </Container>
    
  );
}
const Container = styled.div`
  width: 500px;
  margin: auto;
  height: 1000px;
  overflow: hidden; // 선을 넘어간 이미지들은 숨겨줍니다.
  background-color: lightgray;
`;
const Button = styled.div`
  all: unset;
  padding: 1em 2em;
  margin: 2em 2em;
  color: green;
  border-radius: 10px;
  border: 1px solid green;
  cursor: pointer;
  &:hover {
    background-color: green;
    color: #fff;
  }
`;
const SliderContainer = styled.div`
  margin: 0 auto;
  margin-bottom: 2em;
  display: flex; // 이미지들을 가로로 나열합니다.
`;
const Text = styled.div`
  text-align: center;
  color: green;
  p {
    color: #ffffff;
    font-size: 20px;
    background-color: green;
    display: inline-block;
    border-radius: 10px;
    padding: 0.5em 1em;
  }
`;
const Center = styled.div`
  text-align: center;
`;