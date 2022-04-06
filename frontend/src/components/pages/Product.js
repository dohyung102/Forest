import React, { useState, useEffect, useCallback } from 'react';
import { Link, useParams } from 'react-router-dom';
import { Grid } from '@mui/material';
import axios from 'axios';
import ArrowBackIosIcon from '@mui/icons-material/ArrowBackIos';
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';

import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

import Reviews from './ProductReviews'
import './Product.css'

const Detail = () => {

  const params = useParams()
  console.log(params)
  const [plantData, setPlantData] = useState()
  const [loading, setLoading] = useState(false)
  const [storeProduct, setStoreProduct] = useState()

  const getProduct = useCallback(async () => {
    const headers = {
      Authorization: `Bearer ${localStorage.getItem('token')}`,
    };
    await axios
      .get(`http://j6d204.p.ssafy.io/api/products/${params.product_id}/`, {
        headers: headers,
      })
      .then((res) => {
        console.log(res.data);
        setPlantData(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }, [params]);

  const getStore = useCallback(async () => {
    await axios.get(`http://j6d204.p.ssafy.io/api/stores/${plantData.store}/`)
    .then((res) => {
      console.log(res.data.product_set)
      setStoreProduct(res.data.product_set)
    })
    .catch((err) => {
      console.log(err)
    })
  }, [plantData])

  useEffect(() => {
    getProduct()
  }, [getProduct, loading])

  useEffect(() => {
    getStore()
  }, [getStore])

  const settings = {
    // slide: 'div',
    dots: true,
    infinite: true,
    speed: 500,
    // arrows : true,
    slidesToShow: 4,
    slidesToScroll: 4,
    draggable: false,
    prevArrow: <ArrowBackIosIcon color="primary" />,
    nextArrow: <ArrowForwardIosIcon color="primary" />,
  };

  return (
    <div>
      <div>product page</div>
      <Grid container alignItems="center">
        <Grid item md={6}>
          {plantData && (
            <div className="detail-plant-img">
              <img
                className="detail-plant-img"
                src={plantData.profile_img}
                alt="plant_img"
              />
            </div>
          )}
        </Grid>
        <Grid item md={6}>
          {plantData && (
            <ul className="detail-ul">
              <div>{plantData.name}</div>
              <div>수량 : {plantData.num}</div>
              <div>가격 : {plantData.price}</div>
              <div>open_date : {plantData.open_date}</div>
              <div>close_date : {plantData.close_date}</div>
              <div>식물 pk : {plantData.id}</div>
            </ul>
          )}
        </Grid>

        <p>판매자의 다른 상품</p>
        <div>
          <Slider {...settings}>
            {storeProduct && storeProduct.map((product) => {
              return (
                <div key={product.product_id}>
                  <Link to={`/product/${product.id}`}>
                    <img className='detail-similar-img' src={product.profile_image} alt='plant_img' />
                    <div>{product.name}</div>
                  </Link>
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
              {/* <div>
                이런 이미지도 있으면 좋을거 같은데
              </div>
              <img className='product-img' src='https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/descriptions/url/164559381797134024.jpg' alt='product' /> */}
            </div>
          }
        </div>
        {plantData &&
          <Reviews reviews={plantData.review_set} loading={loading} setLoading={setLoading} />
        }
      </Grid>
    </div>
  );
};

export default Detail;
