import React, { useState, useCallback, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import { Container, Grid } from '@mui/material';

import './Store.css'

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
      <Grid 
        style={{ display: 'flex', flexDirection: 'column', justifyContent: 'center' }}
        onClick={() => moveToStore(store.id)} item md={4} key={store.id}>
        {/* <div> */}
        <img className='store-main-img' alt='store-profile' src={store.profile_image} />
        <div className='store-main-name'>{store.name}</div>
        {/* </div> */}
      </Grid>
    )
  })

  return (
    <div>
      <Container maxWidth='md'>
        <div className='store-main-title'>
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