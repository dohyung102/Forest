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
      <Grid onClick={() => moveToPlantDetail(product.id)} item md={4} key={product.name}>
        <img className='home-plant-img' alt='product-profile' src={product.profile_image} />
        <p>{product.name}</p>
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