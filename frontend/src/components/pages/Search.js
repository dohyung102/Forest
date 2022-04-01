import React, { useEffect, useState, useCallback } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios'

import { Grid } from '@mui/material';

const Search = () => {

  // eslint-disable-next-line react-hooks/exhaustive-deps
  const dummy_plants = [
    {
      'name' : '식물a',
      'img' : 'https://images.pexels.com/photos/1022922/pexels-photo-1022922.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      'tag' : 'long'
    },
    {
      'name' : '식물b',
      'img' : 'https://images.pexels.com/photos/1856450/pexels-photo-1856450.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'tag' : 'long'
    },
    {
      'name' : '식물c',
      'img' : 'https://images.pexels.com/photos/912396/pexels-photo-912396.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'tag' : 'short'
    },
    {
      'name' : '식물d',
      'img' : 'https://images.pexels.com/photos/912410/pexels-photo-912410.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'tag' : 'long'
    },
    {
      'name' : '식물bb',
      'img' : 'https://images.pexels.com/photos/1022922/pexels-photo-1022922.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      'tag' : 'short'
    },
    {
      'name' : '식물aa',
      'img' : 'https://images.pexels.com/photos/1856450/pexels-photo-1856450.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'tag' : 'long'
    },
    {
      'name' : '식물cdca',
      'img' : 'https://images.pexels.com/photos/912396/pexels-photo-912396.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'tag' : 'short'
    },
    {
      'name' : '식물hag',
      'img' : 'https://images.pexels.com/photos/912410/pexels-photo-912410.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'tag' : 'long'
    },
  ]

  const [search, setSearch] = useState('')

  const [activeCategory, setActiveCategory] = useState('All')
  const [wholePlants, setWholePlants] = useState([])
  const [plants, setPlants] = useState(dummy_plants)

  useEffect(() => {
    axios.get('http://localhost:8000/plants/')
      .then((res) => {
        setWholePlants(res.data)
      })
  }, [])

  // useEffect(() => {
  //   activeCategory === 'All'
  //     ? setPlants(dummy_plants)
  //     : setPlants(dummy_plants.filter(plant => plant.tag.includes(activeCategory)))
  // }, [activeCategory, dummy_plants])

  const searchHandle = (event) => {
    setSearch(event.target.value)
  }

  const plant_filter = wholePlants.filter(plant => {
    if (search == null)
      return plant
    else if (plant.name.toLowerCase().includes(search.toLowerCase()))
      return plant
    return null;
  }).map(plant_data => {
    return (
      <Grid key={plant_data.id} item md={3} sx={{ display:'flex', flexDirection:'column', alignItems:'center' }}>
        <Link to={`/detail/${plant_data.name}`}>
          <img className='home-plant-img' src={plant_data.img} alt='plant_img' />
        </Link>
        <p className='home-plant-name'>{plant_data.name}</p>
      </Grid>
    )
  })
  
  const plant_filter2 = plants.filter(plant => {
    if (search == null)
      return plant
    else if (plant.name.toLowerCase().includes(search.toLowerCase()))
      return plant
    return null;
  }).map(plant_data => {
    return (
      <Grid key={plant_data.name} item md={3} sx={{ display:'flex', flexDirection:'column', alignItems:'center' }}>
        <Link to={`/detail/${plant_data.name}`}>
        {/* <Link to={{ pathname: `/detail/${plant_data.name}`, state: { data: plant_data } }}> */}
          <img className='home-plant-img' src={plant_data.img} alt='plant_img' />
        </Link>
        <p className='home-plant-name'>{plant_data.name}</p>
      </Grid>
    )
  })

  // front에서 filter 처리할지, back에서 filter 처리해서 가져올지 고민해봐야
  return (
    <div>
      <div>
        식물 검색
        {/* <SearchIcon /> */}
        <input type='text' name='plant_search' value={ search } onChange={ searchHandle } placeholder='식물 검색' className='' />
        <div>
          <button onClick={ () => setActiveCategory('All') }>all</button>
          <button onClick={ () => setActiveCategory('long') }>long</button>
          <button onClick={ () => setActiveCategory('short') }>short</button>
        </div>
      </div>

      <Grid container>
        {plant_filter}
      </Grid>
    </div>
  );
};

export default Search;