import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';
import { Container, Grid } from '@mui/material';

import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

import './Detail.css';
import axios from 'axios';

const Detail = () => {
  const navigate = useNavigate();
  const params = useParams();
  const [plantData, setPlantData] = useState({});
  const [similar, setSimilar] = useState();
  const [products, setProducts] = useState();

  useEffect(() => {
    console.log(params.plant_id);
    axios({
      method: 'get',
      url: `http://j6d204.p.ssafy.io/api/plants/${params.plant_id}/`,
    })
      .then((res) => {
        console.log('res.data', res.data);
        setPlantData(res.data);
        setSimilar(res.data.similar_plants);
        setProducts(res.data.product_set);
      })
      .catch((err) => {
        console.log(err);
      });
  }, [params.plant_id]);

  const toSimilarPlant = (id) => {
    navigate(`/detail/${id}`);
  };

  const toProduct = (id) => {
    navigate(`/product/${id}`);
  };

  const changeImage = (e) => {
    e.target.src = 'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg'
  }

  const settings = {
    slide: 'div',
    // dots: true,
    infinite: true,
    speed: 1000,
    // arrows : true,
    slidesToShow: 4,
    slidesToScroll: 4,
    draggable: false,
  };

  return (
    <Container maxWidth="md">
      <div>detail page</div>
      <Grid container alignItems="center">
        <Grid item md={6}>
          <div className="detail-plant-img">
            <img
              className="detail-plant-img"
              src={`http://j6d204.p.ssafy.io/backend/media/${plantData.image_path}`}
              alt="plant_img"
            />
          </div>
        </Grid>
        <Grid item md={6}>
          <div className="detail-ul">
            <div>{plantData.name}</div>
            <div>{plantData.character}</div>
            <div>{plantData.watering}</div>
            <div>{plantData.light_demand}</div>
            <div>{plantData.humidity}</div>
            <div>{plantData.manage_difficulty}</div>
            <div>{plantData.growth_rate}</div>
          </div>
        </Grid>
      </Grid>

      <div>유사한 식물</div>
      <Slider {...settings}>
        {similar &&
          similar.map((plant) => {
            return (
              <div
                className="detail-similar"
                key={plant.id}
                onClick={() => toSimilarPlant(plant.id)}
              >
                <img
                  className="detail-similar-img"
                  src={`http://j6d204.p.ssafy.io/backend/media/${plant.image_path}`}
                  alt="plant_img"
                />
                <div className="detail-similar-name">{plant.name}</div>
              </div>
            );
          })}
      </Slider>

      <div>상품 목록</div>
      {products && 
        (products.length > 4
        ?
        <Slider {...settings}>
          {
            products.map(product => {
              return (
                <div
                  className="detail-similar"
                  key={product.id}
                  onClick={() => toProduct(product.id)}
                >
                  <img
                    className="detail-similar-img"
                    src={`http://j6d204.p.ssafy.io/backend/media/${product.profile_image}`} 
                    onError={changeImage}
                    alt="product_img"
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
            products.map(product => {
              return (
                <Grid item md={3}
                  className="detail-similar"
                  key={product.id}
                  onClick={() => toProduct(product.id)}
                >
                  <img
                    className="detail-similar-img"
                    src={`http://j6d204.p.ssafy.io/backend/media/${product.profile_image}`} 
                    onError={changeImage}
                    alt="product_img"
                  />
                  <div className="detail-similar-name">{product.name}</div>
                </Grid>
              )
            })
          }
        </Grid>
        )
      }
    </Container>
  );
};

export default Detail;
