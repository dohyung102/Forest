import React, { useState, useEffect } from 'react';
import { Grid, Container } from '@mui/material';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

import Mynav from '../layout/MypageNavigation';

const MyComments = () => {
  const [myComments, MyComments] = useState([]);
  const navigate = useNavigate();

  const toPost = (index) => {
    navigate(`/community/${index}`);
  };

  useEffect(() => {
    axios({
      method: 'get',
      url: 'http://j6d204.p.ssafy.io/api/accounts/user/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
    })
      .then((res) => {
        console.log(res.data.comment_set);
        MyComments(res.data.comment_set);
      })
      .catch((err) => {
        console.log('error');
      });
  }, []);

  return (
    <Grid container>
      <Grid item md={12}>
        <p className="mypage-title">마이페이지</p>
        <Mynav />
      </Grid>

      <Grid item md={12}>
        <p>작성한 리뷰</p>
      </Grid>
      <div>
        {myComments.map((comment) => {
          return (
            <div key={comment.id}>
              {/* <div>{review.post}</div> */}
              <div onClick={() => toPost(comment.post)}>{comment.content}</div>
            </div>
          );
        })}
      </div>
    </Grid>
  );
};

export default MyComments;
