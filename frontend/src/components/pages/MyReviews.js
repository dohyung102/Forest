import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import { Grid } from '@mui/material';

import Mynav from '../layout/MypageNavigation'

const MyReviews = () => {

  const navigate = useNavigate()
  const [myReview, setMyReview] = useState([])

  const moveToProduct = (index) => {
    navigate(`/product/${index}`)
  }

  useEffect(() => {
    axios({
      method: 'get',
      url: 'http://localhost:8000/api/accounts/user/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      }
    })
      .then((res) => {
        console.log(res.data.review_set)
        setMyReview(res.data.review_set)
      })
      .catch((err) => {
        console.log('error')
      })
  }, [])

  return (
    <Grid container>
      <Grid item md={12}>
        <p className='mypage-title'>마이페이지</p>
        <Mynav />
      </Grid>
      
      <Grid item md={12}>
        <p>작성한 리뷰</p>
      </Grid>
      <div>
        {myReview.map((review) => {
          return (
            <div key={review.id}
              onClick={() => moveToProduct(review.product)}
            >
              <div>{review.context}</div>
              <div>{review.star}</div>
              <div>{review.created_date}</div>
            </div>
          )
        })}
      </div>
    </Grid>
  );
};

export default MyReviews;