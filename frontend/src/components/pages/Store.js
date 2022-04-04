import React, { useEffect, useState, useCallback } from 'react';
import { useParams } from 'react-router-dom';
import { Grid } from '@mui/material';
import axios from 'axios';

import Product from './StoreProduct'

const Store = () => {

  const params = useParams()
  const [storeData, setStoreData] = useState()

  // eslint-disable-next-line react-hooks/exhaustive-deps
  const dummy_products = [
    {
      'name':'111111',
      'img':'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlL3VzZXJzLzE3MzU2OS9wbGFudC1waG90b3MvTm9uZS8xNjQ3NzA2MzY2NTE1LTIyNEJCNzlGLUFBMUQtNDY0Qi04MjI2LUNERjI4QUU0NkE3NC5qcGVn?format=pjpeg&optimize=medium&auto=webp&precrop=1080:1080,smart&fit=crop&width=1080&height=1080',
      'price':'20000',
      'rate':'3',
      'categories': [
        'tall','big',
      ]
    },
    {
      'name':'2222',
      'img':'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlL3VzZXJzLzE3MzU2OS9wbGFudC1waG90b3MvTm9uZS8xNjQ3NzA2MzY2NTE1LTIyNEJCNzlGLUFBMUQtNDY0Qi04MjI2LUNERjI4QUU0NkE3NC5qcGVn?format=pjpeg&optimize=medium&auto=webp&precrop=1080:1080,smart&fit=crop&width=1080&height=1080',
      'price':'21000',
      'rate':'1',
      'categories': [
        'short','big',
      ]
    },
    {
      'name':'3333',
      'img':'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlL3VzZXJzLzE3MzU2OS9wbGFudC1waG90b3MvTm9uZS8xNjQ3NzA2MzY2NTE1LTIyNEJCNzlGLUFBMUQtNDY0Qi04MjI2LUNERjI4QUU0NkE3NC5qcGVn?format=pjpeg&optimize=medium&auto=webp&precrop=1080:1080,smart&fit=crop&width=1080&height=1080',
      'price':'30000',
      'rate':'5',
      'categories': [
        'tall','small',
      ]
    },
    {
      'name':'4444',
      'img':'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlL3VzZXJzLzE3MzU2OS9wbGFudC1waG90b3MvTm9uZS8xNjQ3NzA2MzY2NTE1LTIyNEJCNzlGLUFBMUQtNDY0Qi04MjI2LUNERjI4QUU0NkE3NC5qcGVn?format=pjpeg&optimize=medium&auto=webp&precrop=1080:1080,smart&fit=crop&width=1080&height=1080',
      'price':'20000',
      'rate':'3',
      'categories': [
        'short','small',
      ]
    },
    {
      'name':'5555',
      'img':'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlL3VzZXJzLzE3MzU2OS9wbGFudC1waG90b3MvTm9uZS8xNjQ3NzA2MzY2NTE1LTIyNEJCNzlGLUFBMUQtNDY0Qi04MjI2LUNERjI4QUU0NkE3NC5qcGVn?format=pjpeg&optimize=medium&auto=webp&precrop=1080:1080,smart&fit=crop&width=1080&height=1080',
      'price':'20000',
      'rate':'3',
      'categories': [
        'big','flowery',
      ]
    },
  ]

  const [activeCategory, setActiveCategory] = useState('All')
  const [product, setProduct] = useState(dummy_products)

  const dummy_categories = [
    'All','tall','short','big','small','flowery'
  ]

  const getStore = useCallback(async () => {
    await axios.get(`http://localhost:8000/api/stores/${params.store_id}/`)
    .then((res) => {
      console.log(res.data)
      setStoreData(res.data)
    })
    .catch((err) => {
      console.log(err)
    })
  }, [params])

  useEffect(() => {
    getStore()
  }, [getStore])


  // 카테고리 부분 해결되면 수정 후 재작성
  // useEffect(() => {
  //   activeCategory === 'All'
  //     ? setProduct(dummy_products)
  //     : setProduct(dummy_products.filter((product) => product.categories.includes(activeCategory)))
  // }, [activeCategory, dummy_products])

  return (
    <Grid container>
      <Grid item md={3}>
        {storeData &&
          <div>{storeData.name}</div>
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

        <div>
          <button>상품등록</button>
        </div>
        <div>
          <button>스토어등록</button>
        </div>
      </Grid>
      <Grid item md={9}>
        <div>상품</div>
        {storeData &&
          <Product 
            productsList={storeData.product_set}
          />
        }
        {/* <Product 
          productsList={product}
        /> */}
      </Grid>
    </Grid>
  );
};

export default Store;