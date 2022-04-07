import React, { useEffect, useState, useCallback } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { Grid, Container, Avatar, Button, Divider } from '@mui/material';
import axios from 'axios';

import Product from './StoreProduct';

const Store = () => {

  const params = useParams()
  const [storeData, setStoreData] = useState()
  const navigate = useNavigate()
  const [productSet, setProductSet] = useState([])
  // const [activeCategory, setActiveCategory] = useState('All')
  // const [product, setProduct] = useState(dummy_products)
  const changeImage = (e) => {
    e.target.src = 'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg'
  }
  // const dummy_categories = [
  //   'All','tall','short','big','small','flowery'
  // ]
  useEffect(() => {
    axios.get(`http://j6d204.p.ssafy.io/api/stores/${params.store_id}/`)
    .then((res) => {
      console.log(res.data);
      setStoreData(res.data);
      setProductSet(res.data.product_set)
    })
    .catch((err) => {
      console.log(err);
    });
}, [params]);

const products = productSet
  .map((products) => {
    return (
      <Grid
        key={products.id}
        item
        md={4}
        style={{
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          marginBottom:'10px'
        }}
      >
        <Link to={`/product/${products.id}`} style={{marginBottom:'5px'}}>
          <img
            className="product-img"
            src={`http://j6d204.p.ssafy.io/backend/media/${products.profile_image}`}
            alt="no_image"
            onError={changeImage}
          />
        </Link>
        <Grid>{products.name}</Grid>
        <Grid style={{fontSize:'13px'}}>가격 : {products.price}원</Grid>
      </Grid>
    );
  });
  // const getStore = useCallback(async () => {
  //   await axios
      

  // useEffect(() => {
  //   getStore()
  // }, [getStore])

  const editStore = () => {
    navigate('/seller', { state: storeData })
  }

  // 카테고리 부분 해결되면 수정 후 재작성
  // useEffect(() => {
  //   activeCategory === 'All'
  //     ? setProduct(dummy_products)
  //     : setProduct(dummy_products.filter((product) => product.categories.includes(activeCategory)))
  // }, [activeCategory, dummy_products])

  return (
    <Container maxWidth='md'>
      <Grid container>
        <Grid 
          item 
          container 
          md={3}
          direction="column"
          justifyContent="flex-start"
          alignItems="center"
          style={{marginTop:'20px'}}
        >
          <Grid item>
            {storeData &&
              <Avatar
                alt=""
                src={storeData.profile_image}
                sx={{ width: '150px', height: '150px', marginBottom:'15px'}}
                variant="rounded"
              />
            }
          </Grid>
          {storeData &&
            <Grid style={{fontSize:'20px', marginBottom:'30px'}}>
              {storeData.name}
            </Grid>
          }
          <Grid>
            {storeData && storeData.user === localStorage.getItem('user') ? (
              <Grid
              container 
              direction="column"
              justifyContent="center"
              alignItems="center"
              >
                <Button onClick={editStore} variant='outlined'>스토어변경</Button><br/>
                <Button variant='outlined'>상품 등록</Button>
              </Grid>
            ) : (
              <Grid></Grid>
            )}
          </Grid>
        </Grid>
        <Grid item md={9}>
          <div className='store-title' style={{textAlign:'center', fontSize:'25px', marginBottom:'30px'}}>상품 목록</div>

          {/* {storeData &&
            <Product 
              productsList={storeData.product_set}
            />
          } */}
          <Grid container>{products}</Grid>
        </Grid>

        {/* 디자인 병합 진행중 */}
        <Grid item md={3}>
          {storeData &&
            <div className='store-name'>{storeData.name}</div>
          }
          <div className='store-btn-div'>
            {storeData && storeData.user === localStorage.getItem('user') &&
              <div className='store-btn-list'>
                <button onClick={editStore} className='store-btn'>스토어변경</button>
                <button className='store-btn'>상품등록</button>
              </div>
            }
          </div>
        </Grid>
        <Grid item md={9}>
          <div className='store-main-title'>상품 목록</div>
          <Divider sx={{my: 4}} light variant="middle" />
          {storeData &&
            <Product 
              productsList={storeData.product_set}
            />
          }
          <Grid container>{products}</Grid>
        </Grid>
      </Grid>
    </Container>
  );
};

export default Store;
