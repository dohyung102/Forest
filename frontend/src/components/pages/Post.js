import { Card, CardMedia, Container, Paper } from '@mui/material';
import React from 'react';
import { Link } from 'react-router-dom';

import './Post.css';

const Post = () => {
  const post_dummy_data = {
    idx: '1',
    title: '1111',
    content:
      'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
    img: 'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlL3VzZXJzLzE3MzU2OS9wbGFudC1waG90b3MvTm9uZS8xNjQ3NzA2MzY2NTE1LTIyNEJCNzlGLUFBMUQtNDY0Qi04MjI2LUNERjI4QUU0NkE3NC5qcGVn?format=pjpeg&optimize=medium&auto=webp&precrop=1080:1080,smart&fit=crop&width=1080&height=1080',
    created_at: '2022-03-23 16:20',
    likes: '0',
    user: 'user_aa',
  };

  return (
    <Container maxWidth="md">
      <Paper elevation={0}>
        <CardMedia></CardMedia>
        <div>{post_dummy_data.idx}번 게시글</div>
        <div>좋아요 기능 보류? : {post_dummy_data.likes}</div>
        <div>@{post_dummy_data.user}</div>
        <div>{post_dummy_data.title}</div>
        <div>{post_dummy_data.content}</div>
        <img className="post-img" alt="" src={post_dummy_data.img} />
        <div>작성시간 : {post_dummy_data.created_at}</div>
      </Paper>
      <Link to="/community">
        <button>목록으로</button>
      </Link>
    </Container>
  );
};

export default Post;
