import React, { useState, useEffect } from 'react';
import { Grid, Container } from '@mui/material';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

import Mynav from '../layout/MypageNavigation';
import { Table } from "react-bootstrap";

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
        <h2 className="mypage-title">마이페이지</h2>
        <Mynav />
      </Grid>

      <Table striped bordered hover>
        <thead>
          <tr>
            <th>글 번호</th>
            <th>댓글 내용</th>
            <th>작성일</th>
          </tr>
        </thead>
        {myComments.map((comment) => {
          return (
            <tbody>
              <tr onClick={() => toPost(comment.post)}>
                <td>{comment.id}</td>
                <td>{comment.content}</td>
                <td>{comment.create_date}</td>
              </tr>
            </tbody>
          );
        })}
      </Table>
    </Grid>
  );
};

export default MyComments;
