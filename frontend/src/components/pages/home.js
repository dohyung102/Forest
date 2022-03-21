import React from 'react';
import './Home.css'

import { Grid, Button, Box } from '@mui/material';

const Home = () => {

  const dummy_data = [
    {
      'name' : '식물a',
      'img' : 'https://images.pexels.com/photos/1022922/pexels-photo-1022922.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
    },
    {
      'name' : '식물b',
      'img' : 'https://images.pexels.com/photos/1856450/pexels-photo-1856450.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
    },
    {
      'name' : '식물c',
      'img' : 'https://images.pexels.com/photos/912396/pexels-photo-912396.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
    },
    {
      'name' : '식물d',
      'img' : 'https://images.pexels.com/photos/912410/pexels-photo-912410.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
    },
  ]

  const plant_data = dummy_data.map(plant => {
    return (
      <Grid key={plant.name} item md={3} sx={{ display:'flex', flexDirection:'column', alignItems:'center' }}>
        <img className='home-plant-img' src={plant.img} alt='plant_img' />
        <p className='home-plant-name'>{plant.name}</p>
      </Grid>
    )
  })

  return (
    <div>
      <Grid container className='home-content'>
        <Grid item md={6}>
          <img className='home-content-img' src='https://www.nongsaro.go.kr/ps/img/curation/bigData_2021/20210929/images/picture13.jpg' />
        </Grid>
        <Grid item md={6} sx={{ display:'flex', flexDirection:'column', justifyContent:'center' }}>
          <div className='home-content-text'>
            <p className='home-content-title'>Title</p>
            <p className='home-content-content'>우리 프로젝트가 어떠어떠하니 식물추천을 받아보면 어떻겠냐는 내용이 들어가면 좋을 듯한 자리</p>
            <Box sx={{ display:'flex', justifyContent:'space-evenly' }}>
              <Button style={{ width:'130px', height:'40px', color:'white', backgroundColor:'green' }}>test1</Button>
              <Button style={{ width:'130px', height:'40px', color:'white', backgroundColor:'green' }}>test2</Button>
            </Box>
          </div>
        </Grid>
      </Grid>
      <div>
        <p className='home-plant-title'>TitleTitle</p>
        <Grid container>
          { plant_data }
        </Grid>
      </div>
    </div>
  );
};

export default Home;