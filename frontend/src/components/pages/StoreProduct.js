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
      <Grid 
        style={{ display: 'flex', flexDirection: 'column', justifyContent: 'center' }}
        onClick={() => moveToPlantDetail(product.id)} item md={4} key={product.id}>
        <img className='store-main-img' alt='product-profile' src={product.profile_image} />
        <div className='store-main-name'>{product.name}</div>
        {/* <div>
          (카테고리) {product.category}
        </div> */}
      </Grid>
      // <Grid 
      //   style={{ display: 'flex', flexDirection: 'column', justifyContent: 'center' }}
      //   onClick={() => moveToPlantDetail(product.id)} item md={4} key={product.id}>
      //   {/* <div> */}
      //   <img className='store-main-img' alt='store-profile' src={product.profile_image} />
      //   <div className='store-main-name'>{product.name}</div>
      //   <div className='store-main-name'>수량 : {product.num}</div>
      //   <div className='store-main-name'>가격 : {product.price}</div>
      //   {/* </div> */}
      // </Grid>
    )
  })

  return (
    <Grid container>
      {filteredProduct}
    </Grid>
  );
};

export default StoreProduct;