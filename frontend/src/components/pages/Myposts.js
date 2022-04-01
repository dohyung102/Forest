import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import { Grid } from '@mui/material';

import Mynav from '../layout/MypageNavigation'

const Myposts = () => {

  const navigate = useNavigate()
  // const {state} = useLocation()
  // console.log('state',state)
  const [myPost, setMyPost] = useState([])

  const linkToPostDetail = (index) => {
    navigate(`/community/${index}`, { state: index })
  }

  useEffect(() => {
    axios({
      method: 'get',
      url: 'http://localhost:8000/accounts/user/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      }
    })
      .then((res) => {
        console.log(res.data.post_set)
        setMyPost(res.data.post_set)
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
        <p>작성한 게시글</p>
      </Grid>
      <div>
        {myPost.map((post) => {
          return (
            <div key={post.id}
              onClick={(e) => {linkToPostDetail(post.id, e)}}
            >
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