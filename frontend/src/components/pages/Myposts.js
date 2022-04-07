import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import { Grid, Container } from '@mui/material';

import Mynav from '../layout/MypageNavigation';
import { Table } from "react-bootstrap";

const MyPosts = () => {
  const navigate = useNavigate();
  // const {state} = useLocation()
  // console.log('state',state)
  const [myPost, setMyPost] = useState([]);

  const linkToPostDetail = (index) => {
    navigate(`/community/${index}`, { state: index });
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
      console.log(res.data.post_set);
      setMyPost(res.data.post_set);
    })
    .catch((err) => {
      console.log('error');
    });
  }, []);

  return (
    <Grid container>
      <Grid item md={12}>
      <h2 className="mypage-title">마이페이지</h2>
        <Mynav />
      </Grid>

    <Table striped bordered hover>
      <thead>
        <tr>
          <th width='10%'>글 번호</th>
          <th width='50%'>제목</th>
          <th width='15%'>작성일</th>
        </tr>
      </thead>
      {myPost.map((post) => {
        return (
            <tbody>
              <tr onClick={() => linkToPostDetail(post.id)}>
                <td>{post.id}</td>
                <td>{post.title}</td>
                <td>{post.created_date}</td>
              </tr>
            </tbody>
        );
      })}
    </Table>
      </Grid>
  );
};

export default MyPosts;



