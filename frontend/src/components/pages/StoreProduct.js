import React from 'react';
import { Grid } from '@mui/material';
import { useNavigate } from 'react-router-dom';

const StoreProduct = (props) => {
  // console.log(props)
  const navigate = useNavigate()
  const moveToPlantDetail = (plant_id) => {
    navigate(`/product/${plant_id}`)
  }

  const filteredProduct = props.productsList.map(product => {
    return (
      <Grid onClick={() => moveToPlantDetail(product.id)} item md={4} key={product.id}>
        <img className='store-main-img' alt='product-profile' src={product.profile_image} />
        <div className='store-main-name'>{product.name}</div>
        <div>
          (카테고리) {product.category}
        </div>
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