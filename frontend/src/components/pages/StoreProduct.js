import React from 'react';
import { Grid } from '@mui/material';

const StoreProduct = (props) => {

  const filteredProduct = props.productsList.map(product => {
    return (
      <Grid item md={4} key={product.name}>
        <img className='home-plant-img' alt='' src={product.img} />
        <p>{product.name}</p>
        <div>
          태그 : {product.categories}
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