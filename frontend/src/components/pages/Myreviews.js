import React from 'react';
import { Grid } from '@mui/material';

import Mynav from '../layout/MypageNavigation'

const Myreviews = () => {

  const dummy_userdata = {
    'email' : 'ssafy@ssafy.com',
    'nickname' : '김싸피',
    'gender' : 'F',
    'birthday' : '2022-03-17',
    'password' : '',
    'posts' : [
      {
        'title' : 'a',
        'content' : 'aaaa'
      },
      {
        'title' : 'b',
        'content' : 'bbbb'
      },
      {
        'title' : 'c',
        'content' : 'cccc'
      },
    ],
    'reviews' : [
      {
        'post' : 'a',
        'content' : 'aaaa'
      },
      {
        'post' : 'a',
        'content' : 'bbbb'
      },
      {
        'post' : 'a',
        'content' : 'cccc'
      },
    ],
  }
  // console.log(dummy_userdata.posts)

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
        {dummy_userdata.reviews.map((review, index) => {
          return (
            <div key={index}>
              {/* <div>{review.post}</div> */}
              <div>{review.content}</div>
            </div>
          )
        })}
      </div>
    </Grid>
  );
};

export default Myreviews;