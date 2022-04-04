import React, { useState, useEffect, useCallback } from 'react';
import { Link, useParams } from 'react-router-dom'
import { Grid } from '@mui/material';
import axios from 'axios';
import ArrowBackIosIcon from '@mui/icons-material/ArrowBackIos';
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';

import Slider from 'react-slick'
import "slick-carousel/slick/slick.css"; 
import "slick-carousel/slick/slick-theme.css";

import Comments from './ProductComments'
import './Product.css'

const Detail = () => {

  const params = useParams()
  console.log(params)
  const [plantData, setPlantData] = useState()

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


  const getProduct = useCallback(async () => {
    const headers = {
      'Authorization' : `Bearer ${localStorage.getItem('token')}`
    }
    await axios.get(`http://localhost:8000/api/products/${params.product_id}/`,
      {headers : headers}
    )
    .then((res) => {
      console.log(res.data)
      setPlantData(res.data)
    })
    .catch((err) => {
      console.log(err)
    })
  }, [params])

  useEffect(() => {
    getProduct()
  }, [getProduct])

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
        product page
      </div>
      <Grid container alignItems='center'>
        <Grid item md={6}>
          {plantData &&
            <div className='detail-plant-img'>
              <img className='detail-plant-img' src={plantData.profile_img} alt='plant_img' />
            </div>
          }
        </Grid>
        <Grid item md={6}>
          {plantData &&
            <ul className='detail-ul'>
              <div>{plantData.name}</div>
              <div>수량 : {plantData.num}</div>
              <div>가격 : {plantData.price}</div>
              <div>open_date : {plantData.open_date}</div>
              <div>close_date : {plantData.close_date}</div>
              <div>식물 pk : {plantData.id}</div>
            </ul>
          }
        </Grid>
      </Grid>

      <p>유사한 상품 or 판매자의 다른 상품</p>
      <div>
        <Slider {...settings}>
          {dummy_plant.similar.map((plant) => {
            return (
              <div key={plant.name}>
                <Link to={`/product/${plant.name}`}>
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
      <div>
        <p>상세정보</p>
        {plantData &&
          <div>
            <div>
              {plantData.description}
            </div>
            <div>
              이런 이미지도 있으면 좋을거 같은데
            </div>
            <img className='product-img' src='https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/descriptions/url/164559381797134024.jpg' alt='product' />
          </div>
        }
      </div>
      {plantData &&
        <Comments reviews={plantData.review_set} />
      }
    </div>
  );
};

export default Detail;