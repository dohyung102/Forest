import React, { useState, useEffect } from 'react';
import './Home.css';
import axios from 'axios';
import { Grid, Button, 
  // Box, Card, 
  Container, 
  // CardMedia, CardContent 
} from '@mui/material';
// import { fontFamily, fontSize } from '@mui/system';
import { Link, useNavigate } from 'react-router-dom';
import Slider from 'react-slick';

const Home = () => {
  const [auth, setAuth] = useState(false);
  const [recommPlants, setRecommPlants] = useState([]);
  // const [plants, setPlants] = useState(dummy_plants)
  const settings = {
    slide: 'Grid',
    infinite: true,
    speed: 1000,
    slidesToShow: 4,
    slidesToScroll: 4,
    draggable: false,
    responsive: [
      {
        breakpoint: 800,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
        }
      },
      {
        breakpoint: 620,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 415,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      },
    ]
  };
  const navigate = useNavigate();
  const toPlant = (id) => {
    navigate(`/detail/${id}`);
  };


  useEffect(() => {
    axios({
      method: 'get',
      url: `http://j6d204.p.ssafy.io/api/plants/usercustom/`,
      // url: `http://127.0.0.1:8000/api/plants/usercustom/`,
      // headers: {
      //   Authorization: `Bearer ${localStorage.getItem('token')}`,
      //   // "Content-Type": `multipart/form-data`
      // },
    })
    // axios.get('http://j6d204.p.ssafy.io/api/plants/usercustom/')
    .then((res) => {
      console.log(res.data);
      setRecommPlants(res.data);
    })
    }, []);

  useEffect(() => {
    // if (localStorage.getItem('token'))
    if (localStorage.getItem('token')) setAuth(true);
  }, []);

  const plant_data = recommPlants.map((plant) => {
    return (
      <Grid 
        key={plant.name} 
        item 
        md={3} 
        sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}
        onClick={() => toPlant(plant.id)}  
      >
        <img className="home-plant-img" src={`http://j6d204.p.ssafy.io/backend/media/${plant.image_path}`}  alt="plant_img" />
        <div className="home-plant-name">{plant.name}</div>
      </Grid>
    );
  });

  return (
    <div>
      <Container maxWidth="md">
        <Grid 
          container 
          className="home-content" 
          direction="column"
          justifyContent="center"
          alignItems="center"
        >
          <Grid item style={{color: 'white', fontSize: '30px', position: 'relative', fontFamily: 'eulyooSemiBold' }}>????????? ?????? ????????????</Grid>
          <Grid item style={{color: 'white', fontSize: '30px', position: 'relative', fontFamily: 'eulyooSemiBold' }}>?????? ??????</Grid>
          <Grid item style={{color: 'white', fontSize: '30px', position: 'relative', fontFamily: 'eulyooSemiBold' }}>??????????????????????</Grid>
          <Grid item style={{height: '20px' }}> </Grid>
          <Grid item>
            <Button style={{color: 'white', fontSize: '16px' }}>
            {auth ? ( 
              <Link to="/survey" style={{color: 'white', fontSize: '16px', textDecoration: 'none', fontFamily: 'eulyooSemiBold'}}>????????????</Link>
              ) : (
              <Link to="/login" style={{color: 'white', fontSize: '16px', textDecoration: 'none', fontFamily: 'eulyooSemiBold'}}>????????????</Link> 
            )}
            </Button>
          </Grid>
        </Grid>
      </Container>
      <Container maxWidth="md">
        <Grid >
          <p className="home-plant-title">?????? ??????</p>
          <Slider 
            {...settings}
          >
            {plant_data}
          </Slider>
        </Grid>
      </Container>
    </div>
  );
};

export default Home;
