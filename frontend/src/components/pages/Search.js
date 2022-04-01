import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

import { Chip, Container, Grid, IconButton, InputBase, Paper } from '@mui/material';
import SearchIcon from '@mui/icons-material/Search';

const Search = () => {
  const [search, setSearch] = useState('');

  const [activeCategory, setActiveCategory] = useState('All');
  const [wholePlants, setWholePlants] = useState([]);
  // const [plants, setPlants] = useState(dummy_plants)

  useEffect(() => {
    axios.get('http://localhost:8000/api/plants/').then((res) => {
      console.log(res.data);
      setWholePlants(res.data);
    });
  }, []);

  // useEffect(() => {
  //   activeCategory === 'All'
  //     ? setPlants(dummy_plants)
  //     : setPlants(dummy_plants.filter(plant => plant.tag.includes(activeCategory)))
  // }, [activeCategory, dummy_plants])

  const searchHandle = (event) => {
    setSearch(event.target.value);
  };

  const plant_filter = wholePlants
    .filter((plant) => {
      if (search == null) return plant;
      else if (plant.name.toLowerCase().includes(search.toLowerCase())) return plant;
      return null;
    })
    .map((plant_data) => {
      return (
        <Grid key={plant_data.id} item md={3} sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
          <Link to={`/detail/${plant_data.name}`}>
            <img className="home-plant-img" src={plant_data.image_path} alt="plant_img" />
          </Link>
          <p className="home-plant-name">{plant_data.name}</p>
        </Grid>
      );
    });

  // const plant_filter2 = plants.filter(plant => {
  //   if (search == null)
  //     return plant
  //   else if (plant.name.toLowerCase().includes(search.toLowerCase()))
  //     return plant
  //   return null;
  // }).map(plant_data => {
  //   return (
  //     <Grid key={plant_data.name} item md={3} sx={{ display:'flex', flexDirection:'column', alignItems:'center' }}>
  //       <Link to={`/detail/${plant_data.name}`}>
  //       {/* <Link to={{ pathname: `/detail/${plant_data.name}`, state: { data: plant_data } }}> */}
  //         <img className='home-plant-img' src={plant_data.img} alt='plant_img' />
  //       </Link>
  //       <p className='home-plant-name'>{plant_data.name}</p>
  //     </Grid>
  //   )
  // })

  // front에서 filter 처리할지, back에서 filter 처리해서 가져올지 고민해봐야
  return (
    <div>
      <Container maxWidth="md">
        <Paper component="form" sx={{ p: '2px 4px', display: 'flex', alignItems: 'center', width: 400 }}>
          <IconButton disabled sx={{ p: '10px' }} aria-label="menu">
            <SearchIcon />
          </IconButton>
          <InputBase
            value={search}
            onChange={searchHandle}
            sx={{ ml: 1, flex: 1 }}
            placeholder="식물 검색"
            inputProps={{ 'aria-label': 'search google maps' }}
          />
        </Paper>
        <input type="text" name="plant_search" placeholder="식물 검색" className="" />
      </Container>
      <Container maxWidth="md">
        <div>
          <Chip label="all" onClick={() => setActiveCategory('All')} />
          <button onClick={() => setActiveCategory('All')}>all</button>
          <button onClick={() => setActiveCategory('long')}>long</button>
          <button onClick={() => setActiveCategory('short')}>short</button>
        </div>
      </Container>
      <Container maxWidth="md">
        <Grid container>{plant_filter}</Grid>
      </Container>
    </div>
  );
};

export default Search;
