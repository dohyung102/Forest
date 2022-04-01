import React, { useEffect, useState, useCallback } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios'

import { Grid } from '@mui/material';

const Search = () => {

  const [search, setSearch] = useState('')

  const [activeCategory, setActiveCategory] = useState('All')
  const [wholePlants, setWholePlants] = useState([])
  // const [plants, setPlants] = useState(dummy_plants)

  useEffect(() => {
    axios.get('http://localhost:8000/api/plants/')
      .then((res) => {
        console.log(res.data)
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
        <Link to={`/detail/${plant_data.id}`}>
          <img className='home-plant-img' src={plant_data.image_path} alt='plant_img' />
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