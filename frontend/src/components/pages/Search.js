import React, { useEffect, useState, useCallback } from 'react';
import { styled } from '@mui/material/styles';
import { Link } from 'react-router-dom';
import axios from 'axios';

import {
  Chip,
  Container,
  Grid,
  IconButton,
  InputBase,
  Paper,
} from '@mui/material';
import SearchIcon from '@mui/icons-material/Search';

const ListItem = styled('li')(({ theme }) => ({
  margin: theme.spacing(0.5),
}));

const Search = () => {
  const [search, setSearch] = useState('');

  const [categoryData, setCategoryData] = useState([
    { key: 0, label: 'All', onClicked: false },
    { key: 1, label: 'long', onClicked: false },
    { key: 2, label: 'short', onClicked: false },
  ]);

  const [activeCategory, setActiveCategory] = useState('All');
  const [wholePlants, setWholePlants] = useState([]);
  // const [plants, setPlants] = useState(dummy_plants)

  useEffect(() => {
    axios.get('https://j6d204.p.ssafy.io/api/plants/').then((res) => {
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

  const onClickChip = (chipData) => () => {
    setCategoryData(
      categoryData.map((category) =>
        category.key === chipData.key
          ? { ...category, onClicked: !category.onClicked }
          : category
      )
    );
  };

  const plant_filter = wholePlants
    .filter((plant) => {
      if (search == null) return plant;
      else if (plant.name.toLowerCase().includes(search.toLowerCase()))
        return plant;
      return null;
    })
    .map((plant_data) => {
      return (
        <Grid
          key={plant_data.id}
          item
          md={3}
          sx={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
          }}
        >
          <Link to={`/detail/${plant_data.id}`}>
            <img
              className="home-plant-img"
              src={`https://j6d204.p.ssafy.io/${plant_data.image_path}`}
              alt="plant_img"
            />
          </Link>
          <p className="home-plant-name">{plant_data.name}</p>
        </Grid>
      );
    });

  // front에서 filter 처리할지, back에서 filter 처리해서 가져올지 고민해봐야
  return (
    <div>
      <Container maxWidth="md">
        <Paper
          component="form"
          sx={{
            p: '2px 4px',
            display: 'flex',
            alignItems: 'center',
            width: 400,
          }}
        >
          <IconButton disabled sx={{ p: '10px' }} aria-label="menu">
            <SearchIcon />
          </IconButton>
          <InputBase
            value={search}
            onChange={searchHandle}
            sx={{ ml: 1, flex: 1 }}
            placeholder="식물 검색"
            inputProps={{ 'aria-label': 'search plant' }}
          />
        </Paper>
        {/* <input type="text" name="plant_search" placeholder="식물 검색" className="" /> */}
      </Container>
      <Container maxWidth="md">
        <Paper
          component="ul"
          elevation={0}
          sx={{
            display: 'flex',
            justifyContent: 'flex-start',
            flexWrap: 'wrap',
            listStyle: 'none',
            p: 0.5,
            m: 0,
          }}
        >
          {categoryData.map((data) => {
            let color;

            if (data.onClicked === false) color = 'default';
            else color = 'primary';

            return (
              <ListItem key={data.key}>
                <Chip
                  label={data.label}
                  color={color}
                  sx={{ width: 100 }}
                  onClick={onClickChip(data)}
                />
              </ListItem>
            );
          })}
        </Paper>
      </Container>
      <Container maxWidth="md">
        <Grid container>{plant_filter}</Grid>
      </Container>
    </div>
  );
};

export default Search;
