import React, { useEffect, useState, useCallback } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Grid, Container, Divider } from '@mui/material';
import axios from 'axios';

import Product from './StoreProduct';

const Store = () => {

  const params = useParams()
  const [storeData, setStoreData] = useState()
  const navigate = useNavigate()

  // const [activeCategory, setActiveCategory] = useState('All')
  // const [product, setProduct] = useState(dummy_products)

  // const dummy_categories = [
  //   'All','tall','short','big','small','flowery'
  // ]

  const getStore = useCallback(async () => {
    await axios
      .get(`http://j6d204.p.ssafy.io/api/stores/${params.store_id}/`)
      .then((res) => {
        console.log(res.data);
        setStoreData(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }, [params]);

  useEffect(() => {
    getStore()
  }, [getStore])

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
        <Grid item md={3}>
          {storeData &&
            <div className='store-name'>{storeData.name}</div>
          }

          {/* 카테고리 부분 해결되면 수정 후 재작성 */}

          {/* <div>필터</div>
          <ul>
            {dummy_categories.map(category => {
              return(
                <li key={category}>
                  <button onClick={() => setActiveCategory(category)}>{category}</button>
                </li>
              )
            })}
            <button onClick={() => setActiveCategory('All')}>전체보기</button>
            <button onClick={() => setActiveCategory('tall')}>tall</button>
            <button onClick={() => setActiveCategory('short')}>short</button>
            <button onClick={() => setActiveCategory('big')}>big</button>
            <button onClick={() => setActiveCategory('small')}>small</button>
            <button onClick={() => setActiveCategory('flowery')}>flowery</button>
          </ul> */}

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
        </Grid>
      </Grid>
    </Container>
  );
};

export default Store;
