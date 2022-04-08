import React from 'react';
import { Grid } from '@mui/material';
import { useNavigate } from 'react-router-dom';

const StoreProduct = (props) => {
  const navigate = useNavigate()
  const moveToPlantDetail = (plant_id) => {
    navigate(`/product/${plant_id}`)
  }

  const changeImage = (e) => {
    e.target.src = 'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg'
  }

  const filteredProduct = props.productsList.map(product => {
    return (
      <Grid 
        style={{ display: 'flex', flexDirection: 'column', justifyContent: 'center', alignItems: 'center', marginBottom:'10px' }}
        onClick={() => moveToPlantDetail(product.id)} item md={4} key={product.id}>
        <img className='store-main-img' alt='product-img' 
          src={`http://j6d204.p.ssafy.io/backend/${product.profile_image}`} 
          onError={changeImage}
        />
        <div className='store-main-name'>{product.name}</div>
        <div style={{ fontSize: '15px' }}>{product.price}원</div>
      </Grid>
    )
  })

  return (
    <Grid container>
      {filteredProduct}
    </Grid>
  );
};

export default StoreProduct;