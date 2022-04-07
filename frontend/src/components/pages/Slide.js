// // import React, { useEffect, useState }  from 'react';
// // import { useLocation } from 'react-router-dom';
// // import styled from 'styled-components';
// // import axios from 'axios';

// // export default function Slide({ img, currentslide }) {
  
// //   // const [preferenceId, setPreferenceId] = useState();
// //   const [userPreference, setUserPreference] = useState();

// //   const location = useLocation()
// //   // console.log('state', location.state.ref_id)

// //   useEffect(() => {
// //     // axios({
// //     //   method: 'get',
// //     //   url: 'http://j6d204.p.ssafy.io/api/accounts/user/',
// //     //   headers: {
// //     //     Authorization: `Bearer ${localStorage.getItem('token')}`,
// //     //   },
// //     // })
// //     // .then((res) => {
// //     //   console.log(res.data.preference_set[0].id);
// //     //   setPreferenceId(res.data.preference_set[0].id);
// //     // })
// //     // .catch((err) => {
// //     //   console.log('error');
// //     // });

// //     axios({
// //       method: 'get',
// //       url: `http://j6d204.p.ssafy.io/api/accounts/preference/${localStorage.getItem('ref')}/`,
// //       headers: {
// //         Authorization: `Bearer ${localStorage.getItem('token')}`,
// //       },
// //     })
// //     .then((res) => {
// //       console.log(res.data);
// //       setUserPreference(res.data);
// //     })
// //     .catch((err) => {
// //       console.log('error');
// //     });
// // }, []);


// //   return (
// //     <span>
// //       {userPreference && userPreference.preferPlant.map((preference) => {
// //         return (
// //           <div key={preference.id}>
// //             {/* <IMG src={preference.plant.image_path} /> */}
// //             <IMG src={img} />
// //             <div>
// //                 <div>이름 : {preference.plant.name}</div>
// //                 {/* <div>성장 속도 : {preference.plant.growth_rate}</div> */}
// //                 {/* <div>물 주기 : {preference.plant.watering}</div> */}
// //                 {/* <div>관리 난이도 : {preference.plant.manage_difficulty}</div> */}
// //             </div>
// //           </div>
// //         );
// //       })}
// //     </span>
// //   );
// // }

// // const IMG = styled.img`
// //   width: 500px;
// //   height: 500px;
// // `;


// import React from 'react';
// import styled from 'styled-components';

// export default function Slide({ img }) {
//   return (
//     <div>
//       <IMG src={img} />
//       <div>test</div>
//     </div>
//   );
// }

// const IMG = styled.img`
//   width: 500px;
//   height: 500px;
// `;

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Carousel from 'react-bootstrap/Carousel'
import Card from 'react-bootstrap/Card'
import Button from 'react-bootstrap/Button'
import axios from 'axios';

const Slide = () => {
  const [userPreference, setUserPreference] = useState();
  const navigate = useNavigate()

  const toDetail = (plant) => {
    navigate(`/detail/${plant}`)
  }

  useEffect(() => {

    axios({
      method: 'get',
      url: `http://j6d204.p.ssafy.io/api/accounts/preference/${localStorage.getItem('ref')}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
    })
    .then((res) => {
      console.log(res.data);
      setUserPreference(res.data);
    })
    .catch((err) => {
      console.log('error');
    });
}, []);
  return (
    <div>
      <div style={{ fontSize: '32px', fontWeight: 'bold' , textAlign: 'center', marginBottom: '20px'}}>FOREST가 추천하는 식물</div>
      <Carousel variant="dark"
        indicators={false}
      >
      {userPreference && userPreference.preferPlant.map(plant => {
        return (
          <Carousel.Item>
            <Card style={{ width: '500px', margin: '0 auto' }}>
              <Card.Img variant="top" 
                style={{ objectFit: 'cover'}}
                src={`http://j6d204.p.ssafy.io/backend/media/${plant.plant.image_path}`} />
              <Card.Body>
                <Card.Title>{plant.plant.name}</Card.Title>
                <Card.Text>
                  <div>성장 속도 : {plant.plant.growth_rate}</div>
                  <div>물 주기 : {plant.plant.watering}</div>
                  <div>관리 난이도 : {plant.plant.manage_difficulty}</div>
                </Card.Text>
                <Button onClick={() => toDetail(plant.plant.id)} variant="primary">상세 정보 보기</Button>
              </Card.Body>
            </Card>
          </Carousel.Item>
        )
      })
      }
      </Carousel>
    </div>
  );
};

export default Slide;