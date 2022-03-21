import React from 'react';
import { Button, Grid } from '@mui/material';

import './Mypage.css'
import Mynav from '../layout/MypageNavigation'

const Mypage = () => {

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
      <Grid item md={6}>
        <div className='mypage-img'>
          이미지
        </div>
      </Grid>
      <Grid item md={6}> 
        <p>기본정보</p>
        {/* 반복문으로 어떻게 출력 못할까? */}
        <div>
          <label htmlFor='email_input'>이메일 : </label>
          { dummy_userdata.email }
        </div>
        <div>
          <label htmlFor='email_input'>닉네임 : </label>
          { dummy_userdata.nickname }
        </div>
        <div>
          <label htmlFor='email_input'>성별 : </label>
          { dummy_userdata.gender }
        </div>
        <div>
          <label htmlFor='email_input'>생년월일 : </label>
          { dummy_userdata.birthday }
        </div>
        <Button>프로필 수정</Button>
      </Grid>
      <Grid item md={12}>
        <p>사용자 특성</p>
      </Grid>
    </Grid>
  );
};

export default Mypage;