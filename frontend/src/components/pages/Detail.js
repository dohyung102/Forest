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
  const [product, setProduct] = useState();

  useEffect(() => {
    axios({
      method: 'get',
      url: `http://localhost:8000/api/plants/${params.plant_id}/`,
    })
      .then((res) => {
        console.log('res.data', res.data);
        setPlantData(res.data);
        setSimilar(res.data.similar_plants);
        setProduct(res.data.product_set);
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

  const settings = {
    slide: 'div',
    // dots: true,
    infinite: true,
    speed: 1000,
    // arrows : true,
    slidesToShow: 4,
    slidesToScroll: 4,
    draggable: false,
    // prevArrow: <ArrowBackIosIcon color='primary' />,
    // nextArrow: <ArrowForwardIosIcon color='primary' />,
  };

  return (
    <Container maxWidth="md">
      <div>detail page</div>
      <Grid container alignItems="center">
        <Grid item md={6}>
          <div className="detail-plant-img">
            <img
              className="detail-plant-img"
              src={plantData.image_path}
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

      <p>유사한 식물</p>
      <Slider {...settings}>
        {similar &&
          similar.map((plant) => {
            return (
              <div
                className="detail-similar"
                key={plant.name}
                onClick={() => toSimilarPlant(plant.id)}
              >
                <img
                  className="detail-similar-img"
                  src={'http://localhost:8000/media/' + plant.image_path}
                  alt="plant_img"
                />
                <div className="detail-similar-name">{plant.name}</div>
              </div>
            );
          })}
      </Slider>

      <p>상품 목록</p>
      <Slider {...settings}>
        {product &&
          product.map((product) => {
            return (
              <div
                className="detail-similar"
                key={product.name}
                onClick={() => toProduct(product.id)}
              >
                <img
                  className="detail-similar-img"
                  src={product.profile_image}
                  alt="plant_img"
                />
                <div className="detail-similar-name">{product.name}</div>
              </div>
            );
          })}
      </Slider>
    </Container>
  );
};

export default Detail;
