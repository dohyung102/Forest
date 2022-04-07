import { Grid } from '@mui/material';
import React from 'react';
import { useNavigate } from 'react-router-dom';

const MypageNavigation = () => {

  const navigate = useNavigate()
  const profileNavigate = (page) => {
    // navigate(`/mypage${page}`, { state: props.userData })
    navigate(`/mypage${page}`)
  }

  return (
    <div>
      <Grid
        container
        direction="row"
        justifyContent="space-around"
        alignItems="center"
        style={{marginBottom:'20px'}}
      >
        <Grid onClick={() => {profileNavigate('')}} style={{fontSize:'20px'}}>내 프로필</Grid>
        <Grid onClick={() => {profileNavigate('/posts')}} style={{fontSize:'20px'}}>내 글</Grid>
        <Grid onClick={() => {profileNavigate('/comments')}} style={{fontSize:'20px'}}>내 댓글</Grid>
        <Grid onClick={() => {profileNavigate('/reviews')}} style={{fontSize:'20px'}}>내 리뷰</Grid>
      </Grid>
      {/* <ul className='nav-ul'>
        <li onClick={() => {profileNavigate('')}}>프로필</li>
        <li onClick={() => {profileNavigate('/posts')}}>내 글</li>
        <li onClick={() => {profileNavigate('/comments')}}>내 댓글</li>
        <li onClick={() => {profileNavigate('/reviews')}}>내 리뷰</li>
      </ul> */}
    </div>
  );
};

export default MypageNavigation;