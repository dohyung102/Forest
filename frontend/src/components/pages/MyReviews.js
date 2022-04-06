import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import { Grid, Container } from '@mui/material';

import Mynav from '../layout/MypageNavigation';
import { Table } from "react-bootstrap";

const MyReviews = () => {

  const navigate = useNavigate()
  const [myReview, setMyReview] = useState([])

  const moveToProduct = (index) => {
    navigate(`/product/${index}`)
  }

  useEffect(() => {
    axios({
      method: 'get',
      url: 'http://j6d204.p.ssafy.io/api/accounts/user/',
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
        <h2 className="mypage-title">마이페이지</h2>
          <Mynav />
        </Grid>
        <Table striped bordered hover>
      <thead>
        <tr>
          <th>상품명</th>
          <th>리뷰제목</th>
          <th>리뷰내용</th>
          <th>별점</th>
          <th>작성일</th>
        </tr>
      </thead>
      {myReview.map((review) => {
        return (
            <tbody>
              <tr onClick={() => moveToProduct(review.product)}>
                <td>{review.product}</td>
                <td>{review.title}</td>
                <td>{review.context}</td>
                <td>{review.star}</td>
                <td>{review.created_date}</td>
              </tr>
            </tbody>
        );
      })}
    </Table>
      </Grid>
  );
};

export default MyReviews;