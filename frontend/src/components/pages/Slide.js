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
      alert('설문 조사를 먼저 진행해주세요.')
      navigate('/survey')
    });
}, []);
  return (
    <div>
      <div style={{ fontSize: '32px', fontWeight: 'bold' , textAlign: 'center', margin: '20px 0'}}>FOREST가 추천하는 식물</div>
      <Carousel variant="dark"
        indicators={false}
      >
      {userPreference && userPreference.preferPlant.map(plant => {
        return (
          <Carousel.Item key={plant.id}>
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