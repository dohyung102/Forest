import React, { useState, useEffect, useCallback } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Grid, Divider } from '@mui/material';
import axios from 'axios';
// import ArrowBackIosIcon from '@mui/icons-material/ArrowBackIos';
// import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';

// import ProductCarousel from './ProductCarousel';

// import Slider from 'react-slick';
// import 'slick-carousel/slick/slick.css';
// import 'slick-carousel/slick/slick-theme.css';

import Reviews from './ProductReviews'
import './Product.css'

const Detail = () => {

  const params = useParams()
  const navigate = useNavigate()
  // console.log(params)
  const [plantData, setPlantData] = useState()
  const [loading, setLoading] = useState(false)
  // const [storeProduct, setStoreProduct] = useState([])

  const changeImage = (e) => {
    e.target.src = 'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg'
  }

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

  // const getStore = useCallback(async () => {
  //   await axios.get(`http://j6d204.p.ssafy.io/api/stores/${plantData.store}/`)
  //   .then((res) => {
  //     // console.log('store_data',res.data.product_set)
  //     setStoreProduct([res.data.product_set])
  //   })
  //   .catch((err) => {
  //     console.log(err)
  //   })
  // }, [plantData])

  useEffect(() => {
    getProduct()
  }, [getProduct, loading])

  // useEffect(() => {
  //   getStore()
  // }, [getStore])

  const toDetail = (plant_id) => {
    navigate(`/detail/${plant_id}`)
  }

  const toStore = (store_id) => {
    navigate(`/store/${store_id}`)
  }

  const addToCart = () => {
    axios({
      method: 'post',
      url: `http://j6d204.p.ssafy.io/api/products/${plantData.id}/wishlist/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
    })
      .then((res) => {
        console.log(res)
      })
      .catch((err) => {
        console.log(err)
      })
  }
  
  // const toProduct = (id) => {
  //   navigate(`/product/${id}`);
  // };

  // const sameStoreProducts = storeProduct.map((product) => {
  //   console.log('map test', storeProduct)
  //   return (
  //     <div key={product.id}>
  //       <Link to={`/product/${product.id}`}>
  //         <img className='detail-similar-img' src={product.profile_image} alt='plant_img' />
  //         <div>{product.name}</div>
  //       </Link>
  //     </div>
  //   )
  // })

  // const settings = {
  //   slide: 'div',
  //   dots: true,
  //   infinite: true,
  //   speed: 500,
  //   // arrows : true,
  //   slidesToShow: 4,
  //   slidesToScroll: 4,
  //   draggable: false,
  // };

  return (
    <div>
      <div className='product-title'>상품 상세페이지</div>
      <Divider sx={{my: 4}} light />
      <Grid container alignItems="center">
        <Grid item md={6}>
          {plantData && (
            <div className="detail-plant-img">
              <img
                className="detail-plant-img"
                src={`http://j6d204.p.ssafy.io/backend/media/${plantData.profile_image}`} 
                onError={changeImage}
                alt="plant_img"
              />
            </div>
          )}
        </Grid>
        <Grid item md={6}>
          {plantData && (
            <ul className="detail-ul">
              <div className='product-name'>{plantData.name}</div>
              <Divider sx={{my: 2}} light />
              <div className='product-price'>{plantData.price}원</div>
              <div className='product-content'>남은 수량  {plantData.num}</div>
              <div className='product-content'>판매기간 : {plantData.open_date} ~ {plantData.close_date}</div>
              <div className='product-btn-div'>
                <button 
                  className='product-btn'
                  onClick={() => toStore(plantData.store)}
                >
                  판매자의 다른 상품 보러 가기
                </button>
                <button 
                  className='product-btn'
                  onClick={() => toDetail(plantData.plant)}
                >
                  식물 정보 보러 가기
                </button>
                <button 
                  className='product-btn'
                  onClick={addToCart}
                >
                  장바구니 담기
                </button>
              </div>
            </ul>
          )}
        </Grid>

        {/* Carousel 부분 일단 보류 */}

        {/* <ProductCarousel store={plantData.store} /> */}
        {/* <p>판매자의 다른 상품</p>
        {storeProduct && 
          (storeProduct.length > 4
          ?
          <Slider {...settings}>
            {
              storeProduct.map(product => {
                return (
                  <div
                    key={product.id}
                    onClick={() => toProduct(product.id)}
                  >
                    <img
                      className="product-same-store-img"
                      src={product.profile_image}
                      alt="plant_img"
                    />
                    <div className="detail-similar-name">{product.name}</div>
                  </div>
                )
              })
            }
          </Slider>
          :
          <Grid container>
            {
              storeProduct.map(product => {
                return (
                  <Grid item md={3}
                    key={product.id}
                    onClick={() => toProduct(product.id)}
                  >
                    <img
                      className="product-same-store-img"
                      src={product.profile_image}
                      alt="plant_img"
                    />
                    <div className="product-same-store-name">{product.name}</div>
                  </Grid>
                )
              })
            }
          </Grid>
          )
        } */}

        {/* <div>
          <Slider {...settings}>
            {storeProduct && storeProduct.map((product) => {
              return (
                <div key={product.id}>
                  <Link to={`/product/${product.id}`}>
                    <img className='detail-similar-img' src={product.profile_image} alt='plant_img' />
                    <div>{product.name}</div>
                  </Link>
                </div>
              )
            })}
          </Slider>
        </div> */}
        <Grid item xs={12}>
          <Divider sx={{my: 4}} light />
          <div className='product-sub-title'>상세정보</div>
          {plantData &&
            <div className='product-sub-content'>
              {plantData.description}
            </div>
              // {/* <div>
              //   이런 이미지도 있으면 좋을거 같은데
              // </div>
              // <img className='product-img' src='https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/descriptions/url/164559381797134024.jpg' alt='product' /> */}
          }

          {plantData &&
            <Reviews reviews={plantData.review_set} loading={loading} setLoading={setLoading} />
          }
        </Grid>
      </Grid>
    </div>
  );
};

export default Detail;
