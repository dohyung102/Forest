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
  
  const changeImage = (e) => {
    e.target.src = 'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg'
  }

  const getStores = useCallback(async () => {
    // 나중에 지우기
    const headers = {
      Authorization: `Bearer ${localStorage.getItem('token')}`,
    };

    // await axios.get('http://j6d204.p.ssafy.io/api/stores/')
    await axios.get('http://j6d204.p.ssafy.io/api/products/' , {
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

  const createProduct = () => {
    axios({
      method: 'get',
      url: 'http://j6d204.p.ssafy.io/api/accounts/user/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
    })
      .then((res) => {
        if (!res.data.role) {
          alert('판매자 신청을 해주세요.')
          navigate('/sellerauth')
        }
        else if (!res.data.store_set) {
          alert('스토어 등록을 해주세요.')
          navigate('/seller')
        }
        else {
          navigate('/sell_regist')
        }
      })
      .catch((err) => {
        console.log('error');
      });
  }

  const productGrid = productList.map(product => {
    return (
      <Grid 
        style={{ display: 'flex', flexDirection: 'column', justifyContent: 'center' }}
        onClick={() => moveToProduct(product.id)} item md={4} key={product.id}>
        {/* <div> */}
        <img className='store-main-img' alt='store-profile' onError={changeImage}
          src={`http://j6d204.p.ssafy.io/backend/${product.profile_image}`} 
        />
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
        {localStorage.getItem('role') &&
          <button
            className='store-main-btn'
            onClick={createProduct}
          >
            상품등록
          </button>
        }
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