// import React, { useEffect, useRef, useState } from 'react';
// import styled from 'styled-components';
// import Slide from './Slide';
// import img1 from './img/1.jpg';
// import img2 from './img/2.jpg';
// import img3 from './img/3.jpeg';

// const TOTAL_SLIDES = 9; // 전체 슬라이드 개수(총3개. 배열로 계산)

// export default function Slider() {
//   const [currentSlide, setCurrentSlide] = useState(0);
//   const slideRef = useRef(null);



//   // Next 버튼 클릭 시
//   const NextSlide = () => {
//     if (currentSlide >= TOTAL_SLIDES) {
//       // 더 이상 넘어갈 슬라이드가 없으면
//       setCurrentSlide(0); // 1번째 사진으로 넘어갑니다.
//       // return;  // 클릭이 작동하지 않습니다.
//     } else {
//       setCurrentSlide(currentSlide + 1);
//     }
//   };
//   // Prev 버튼 클릭 시
//   const PrevSlide = () => {
//     if (currentSlide === 0) {
//       setCurrentSlide(TOTAL_SLIDES); // 마지막 사진으로 넘어갑니다.
//       // return;  // 클릭이 작동하지 않습니다.
//     } else {
//       setCurrentSlide(currentSlide - 1);
//     }
//   };

//   useEffect(() => {
//     slideRef.current.style.transition = 'all 0.5s ease-in-out';
//     slideRef.current.style.transform = `translateX(-${currentSlide}00%)`; // 백틱을 사용하여 슬라이드로 이동하는 에니메이션을 만듭니다.
//   }, [currentSlide]);


//   return (
//     <Container>
//       <Text>
//         <h1>FOREST가 추천합니다!</h1>
//         <p>Best {currentSlide + 1}</p>
//       </Text>
//       <SliderContainer ref={slideRef}>
//         <Slide img={'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg'} />
//         <Slide img={img2} />
//       </SliderContainer>
//       <Center>
//         <Button onClick={PrevSlide}>이전</Button>
//         <Button onClick={NextSlide}>다음</Button>
//       </Center>
//     </Container>
    
//   );
// }
// const Container = styled.div`
//   width: 500px;
//   margin: auto;
//   height: 700px;
//   overflow: hidden; // 선을 넘어간 이미지들은 숨겨줍니다.
//   background-color: lightgray;
// `;
// const Button = styled.div`
//   all: unset;
//   padding: 1em 2em;
//   margin: 2em 2em;
//   color: green;
//   border-radius: 10px;
//   border: 1px solid green;
//   cursor: pointer;
//   &:hover {
//     background-color: green;
//     color: #fff;
//   }
// `;
// const SliderContainer = styled.div`
//   margin: 0 auto;
//   margin-bottom: 2em;
//   display: flex; // 이미지들을 가로로 나열합니다.
// `;
// const Text = styled.div`
//   text-align: center;
//   color: green;
//   p {
//     color: #ffffff;
//     font-size: 20px;
//     background-color: green;
//     display: inline-block;
//     border-radius: 10px;
//     padding: 0.5em 1em;
//   }
// `;
// const Center = styled.div`
//   text-align: center;
// `;

// import React, { useEffect, useRef, useState } from 'react';
// import styled from 'styled-components';
// import Slide from './Slide';
// import axios from 'axios'
// // import img1 from 'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg';
// // import img2 from 'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg';
// // import img3 from 'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg';

// const TOTAL_SLIDES = 9; // 전체 슬라이드 개수(총3개. 배열로 계산)

// export default function Slider() {
//   const [currentSlide, setCurrentSlide] = useState(0);
//   const slideRef = useRef(null);
//   const [userPreference, setUserPreference] = useState();

//   useEffect(() => {
//     axios({
//       method: 'get',
//       url: `http://j6d204.p.ssafy.io/api/accounts/preference/${localStorage.getItem('ref')}/`,
//       headers: {
//         Authorization: `Bearer ${localStorage.getItem('token')}`,
//       },
//     })
//     .then((res) => {
//       console.log(res.data);
//       setUserPreference(res.data);
//     })
//     .catch((err) => {
//       console.log('error');
//     });
// }, []);

//   // Next 버튼 클릭 시
//   const NextSlide = () => {
//     if (currentSlide >= TOTAL_SLIDES) {
//       // 더 이상 넘어갈 슬라이드가 없으면
//       setCurrentSlide(0); // 1번째 사진으로 넘어갑니다.
//       // return;  // 클릭이 작동하지 않습니다.
//     } else {
//       setCurrentSlide(currentSlide + 1);
//     }
//   };
//   // Prev 버튼 클릭 시
//   const PrevSlide = () => {
//     if (currentSlide === 0) {
//       setCurrentSlide(TOTAL_SLIDES); // 마지막 사진으로 넘어갑니다.
//       // return;  // 클릭이 작동하지 않습니다.
//     } else {
//       setCurrentSlide(currentSlide - 1);
//     }
//   };

//   useEffect(() => {
//     slideRef.current.style.transition = 'all 0.5s ease-in-out';
//     slideRef.current.style.transform = `translateX(-${currentSlide}00%)`; // 백틱을 사용하여 슬라이드로 이동하는 에니메이션을 만듭니다.
//   }, [currentSlide]);

//   return (
//     <div className='Container'>
//       {userPreference &&
//         <div>
//         <div className='Text'>
//           <h1>FOREST가 추천하는 식물</h1>
//           <p>{currentSlide + 1}</p>
//         </div>
//         <div className='SliderContainer' ref={slideRef}>
//           {/* <Slide img={'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg'} /> */}
//           <Slide img={userPreference[0].plant.image_path} />
//           {/* <Slide img={userPreference[0].plant.image_path} data={userPreference[1]} />
//           <Slide img={userPreference[0].plant.image_path} data={userPreference[2]} />
//           <Slide img={userPreference[0].plant.image_path} data={userPreference[3]} />
//           <Slide img={userPreference[0].plant.image_path} data={userPreference[4]} />
//           <Slide img={userPreference[0].plant.image_path} data={userPreference[5]} />
//           <Slide img={userPreference[0].plant.image_path} data={userPreference[6]} />
//           <Slide img={userPreference[0].plant.image_path} data={userPreference[7]} />
//           <Slide img={userPreference[0].plant.image_path} data={userPreference[8]} />
//         <Slide img={userPreference[0].plant.image_path} data={userPreference[9]} /> */}
//         </div>
//         <div className='Center'>
//           <button className='Button' onClick={PrevSlide}>Prev</button>
//           <button className='Button' onClick={NextSlide}>Next</button>
//         </div>
//       </div>
//       }
//     </div>
//   );
// }
// const Container = styled.div`
//   width: 500px;
//   margin: auto;
//   height: 1000px;
//   overflow: hidden; // 선을 넘어간 이미지들은 숨겨줍니다.
// `;
// const Button = styled.div`
//   all: unset;
//   padding: 1em 2em;
//   margin: 2em 2em;
//   color: burlywood;
//   border-radius: 10px;
//   border: 1px solid burlywood;
//   cursor: pointer;
//   &:hover {
//     background-color: burlywood;
//     color: #fff;
//   }
// `;
// const SliderContainer = styled.div`
//   margin: 0 auto;
//   margin-bottom: 2em;
//   display: flex; // 이미지들을 가로로 나열합니다.
// `;
// const Text = styled.div`
//   text-align: center;
//   color: burlywood;
//   p {
//     color: #fff;
//     font-size: 20px;
//     background-color: burlywood;
//     display: inline-block;
//     border-radius: 50px;
//     padding: 0.5em 1em;
//   }
// `;
// const Center = styled.div`
//   text-align: center;
// `;

import React from 'react';
import Slide from './Slide'

const Carousel = () => {
  return (
    <div>
      <Slide />
    </div>
  );
};

export default Carousel;