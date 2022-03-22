import React from 'react';
import { Link } from 'react-router-dom'
import { Grid } from '@mui/material';
import ArrowBackIosIcon from '@mui/icons-material/ArrowBackIos';
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';

import Slider from 'react-slick'
import "slick-carousel/slick/slick.css"; 
import "slick-carousel/slick/slick-theme.css";

import './Detail.css'

const Detail = () => {

  const dummy_plant = {
    'name' : '식물a',
    'img' : 'https://images.pexels.com/photos/1022922/pexels-photo-1022922.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'tag' : 'long',
    'care' : '관리방법',
    'size' : 'tall',
    'difficulty' : '5',
    'caution' : '주의사항',
    'price' : '19,900',
    'rate' : '4',
    'product_link' : 'https://www.naver.com/',
    'similar' : [
      {
        'name':'유사식물a',
        'img':'https://images.pexels.com/photos/1022922/pexels-photo-1022922.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
        'price':'20,000',
        'rate':'4'
      },
      {
        'name':'유사식물b',
        'img':'https://images.pexels.com/photos/1022922/pexels-photo-1022922.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
        'price':'30,000',
        'rate':'3'
      },
      {
        'name':'유사식물c',
        'img':'https://images.pexels.com/photos/1022922/pexels-photo-1022922.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
        'price':'10,000',
        'rate':'5'
      },
      {
        'name':'유사식물e',
        'img':'https://images.pexels.com/photos/1022922/pexels-photo-1022922.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
        'price':'10,000',
        'rate':'5'
      },
      {
        'name':'유사식물f',
        'img':'https://images.pexels.com/photos/1022922/pexels-photo-1022922.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
        'price':'10,000',
        'rate':'5'
      },
    ],
  }

  const similar_plant = dummy_plant.similar.map(plant => {
    return (
      // <Grid container>
        // <Grid key={plant.name} item md={3} sx={{ display:'flex', flexDirection:'column', alignItems:'center' }}>
        <div>
          <Link to={`/detail/${plant.name}`}>
            <img className='home-plant-img' src={plant.img} alt='plant_img' />
          </Link>
          <p className='home-plant-name'>{plant.name}</p>
          <p className='home-plant-name'>{plant.price}</p>
          <p className='home-plant-name'>{plant.rate}</p>
        </div>
        // </Grid>
      // </Grid>
    )
  })

  const settings = {
    // slide: 'div',
    dots: true,
    infinite: true,
    speed: 500,
    // arrows : true,
    slidesToShow: 4,
    slidesToScroll: 4,
    draggable : false,
    prevArrow: <ArrowBackIosIcon color='primary' />,
    nextArrow: <ArrowForwardIosIcon color='primary' />,
  };

  return (
    <div>
      <div>
        detail page
      </div>
      <Grid container alignItems='center'>
        <Grid item md={6}>
          <div className='detail-plant-img'>
            <img className='detail-plant-img' src={dummy_plant.img} alt='plant_img' />
          </div>
        </Grid>
        <Grid item md={6}>
          <ul className='detail-ul'>
            <div>{dummy_plant.name}</div>
            <div>{dummy_plant.tag}</div>
            <div>{dummy_plant.care}</div>
            <div>{dummy_plant.size}</div>
            <div>{dummy_plant.difficulty}</div>
            <div>{dummy_plant.caution}</div>
            <div>{dummy_plant.price}</div>
            <div>{dummy_plant.rate}</div>
            <div>{dummy_plant.product_link}</div>
          </ul>
        </Grid>
      </Grid>

      <p>유사한 식물</p>
      <div>
        <Slider {...settings}>
          {dummy_plant.similar.map((plant) => {
            return (
              <div key={plant.name}>
                <Link to={`/detail/${plant.name}`}>
                  <img className='detail-similar-img' src={plant.img} alt='plant_img' />
                </Link>
                <div>{plant.name}</div>
                <div>{plant.price}</div>
                <div>{plant.rate}</div>
              </div>
            )
          })}
        </Slider>

      </div>
    </div>
  );
};

export default Detail;