import React, { useState, useCallback, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import { Container, Grid, Divider } from '@mui/material';

import './Store.css'

const StoreMain = () => {

  const [productList, setProductList] = useState([])
  const navigate = useNavigate()

  const moveToProduct = (product_id) => {
    navigate(`/product/${product_id}`)
  }
  
  const getStores = useCallback(async () => {
    // 나중에 지우기
    const headers = {
      Authorization: `Bearer ${localStorage.getItem('token')}`,
    };

    // await axios.get('http://j6d204.p.ssafy.io/api/stores/')
    await axios.get('http://j6d204.p.ssafy.io/api/products/' , {
      headers: headers,
    })
    .then((res) => {
      // console.log(res.data)
      res.data.reverse()
      setProductList(res.data)
    })
    .catch((err) => {
      console.log(err)
    })
  }, [])

  useEffect(() => {
    getStores()
  }, [getStores])

  const productGrid = productList.map(product => {
    return (
      <Grid 
        style={{ display: 'flex', flexDirection: 'column', justifyContent: 'center' }}
        onClick={() => moveToProduct(product.id)} item md={4} key={product.id}>
        {/* <div> */}
        <img className='store-main-img' alt='store-profile' src={product.profile_image} />
        <div className='store-main-name'>{product.name}</div>
        <div className='store-main-name'>수량 : {product.num}</div>
        <div className='store-main-name'>가격 : {product.price}</div>
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
        <Divider sx={{my: 4}} light variant="middle" />
        <Grid
          container
          spacing={0}
        >  
          {productGrid}
        </Grid>
      </Container>
    </div>
  );
};

export default StoreMain;