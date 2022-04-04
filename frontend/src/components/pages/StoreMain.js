import React, { useState, useCallback, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import { Container, Grid } from '@mui/material';

const StoreMain = () => {

  const [storeList, setStoreList] = useState([])
  const navigate = useNavigate()

  const moveToStore = (store_id) => {
    navigate(`/store/${store_id}`)
  }
  
  const getStores = useCallback(async () => {

    await axios.get('http://localhost:8000/api/stores/')
    .then((res) => {
      console.log(res.data)
      setStoreList(res.data)
    })
    .catch((err) => {
      console.log(err)
    })
  }, [])

  useEffect(() => {
    getStores()
  }, [getStores])

  const storeGrid = storeList.map(store => {
    return (
      <Grid onClick={() => moveToStore(store.id)} item md={4} key={store.id}>
        <img className='home-plant-img' alt='store-profile' src={store.profile_image} />
        <p>{store.name}</p>
      </Grid>
    )
  })

  return (
    <div>
      <Container maxWidth='md'>
        <div>
          스토어
        </div>
        <Grid
          container
          spacing={0}
        >  
          {storeGrid}
        </Grid>
      </Container>
    </div>
  );
};

export default StoreMain;