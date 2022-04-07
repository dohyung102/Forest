// import React, { useState, useEffect, useCallback } from 'react';
// import { Link, useParams, useNavigate } from 'react-router-dom';
// import axios from 'axios';

// import Slider from 'react-slick';
// import 'slick-carousel/slick/slick.css';
// import 'slick-carousel/slick/slick-theme.css';

// const ProductCarousel = (props) => {
//   console.log(props)

//   // const getStore = useCallback(async () => {
//   //   await axios.get(`http://j6d204.p.ssafy.io/api/stores/${plantData.store}/`)
//   //   .then((res) => {
//   //     console.log('store_data',res.data.product_set)
//   //     setStoreProduct([res.data.product_set])
//   //   })
//   //   .catch((err) => {
//   //     console.log(err)
//   //   })
//   // }, [plantData])

//   // useEffect(() => {
//   //   getStore()
//   // }, [getStore])

//   const settings = {
//     slide: 'div',
//     dots: true,
//     infinite: true,
//     speed: 500,
//     // arrows : true,
//     slidesToShow: 4,
//     slidesToScroll: 4,
//     draggable: false,
//     // prevArrow: <ArrowBackIosIcon color="primary" />,
//     // nextArrow: <ArrowForwardIosIcon color="primary" />,
//   };

//   return (
//     {storeProduct && 
//       (storeProduct.length > 4
//       ?
//       <Slider {...settings}>
//         {
//           storeProduct.map(product => {
//             return (
//               <div
//                 key={product.id}
//                 onClick={() => toProduct(product.id)}
//               >
//                 {/* <img
//                   className="product-same-store-img"
//                   src={product.profile_image}
//                   alt="plant_img"
//                 /> */}
//                 <div className="product-same-store-name">{product.name}</div>
//               </div>
//             )
//           })
//         }
//       </Slider>
//       :
//       <Grid container>
//         {
//           storeProduct.map(product => {
//             return (
//               <Grid item md={3}
//                 key={product.id}
//                 onClick={() => toProduct(product.id)}
//               >
//                 <img
//                   className="product-same-store-img"
//                   src={product.profile_image}
//                   alt="plant_img"
//                 />
//                 <div className="product-same-store-name">{product.name}</div>
//               </Grid>
//             )
//           })
//         }
//       </Grid>
//       )
//     }
//   );
// };

// export default ProductCarousel;