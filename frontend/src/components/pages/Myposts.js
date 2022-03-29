import React from 'react';
import { Grid } from '@mui/material';

import Mynav from '../layout/MypageNavigation'

const Myposts = () => {

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
        'link' : 'a',
        'content' : 'aaaa'
      },
      {
        'link' : 'a',
        'content' : 'bbbb'
      },
      {
        'link' : 'a',
        'content' : 'cccc'
      },
    ],
  }

  return (
    <Grid container>
      <Grid item md={12}>
        <p className='mypage-title'>마이페이지</p>
        <Mynav />
      </Grid>
      
      <Grid item md={12}>
        <p>작성한 게시글</p>
      </Grid>
      <div>
        {dummy_userdata.posts.map((post, index) => {
          return (
            <div key={index}>
              <div>{post.title}</div>
              <div>{post.content}</div>
            </div>
          )
        })}
      </div>
    </Grid>
  );
};

export default Myposts;