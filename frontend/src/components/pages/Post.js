import React, { useState, useEffect, useCallback } from 'react';
import axios from 'axios';
import { Link, useParams, useNavigate } from 'react-router-dom';
import {
  Card,
  CardMedia,
  Container,
  Paper,
  Box,
  Typography,
  Avatar,
  Button,
} from '@mui/material';

import Comment from './Comment';
import './Post.css';

const Post = () => {
  const navigate = useNavigate();
  const [postData, setPostData] = useState([]);
  const [edit, setEdit] = useState(false);
  const [userData, setUserData] = useState([]);
  const formData = new FormData();
  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');
  const [preview, setPreview] = useState('');
  const [image, setImage] = useState('');

  const params = useParams();
  // console.log(params)

  const titleHandle = (event) => {
    setTitle(event.target.value);
  };
  const contentHandle = (event) => {
    setContent(event.target.value);
  };
  const loadFile = (event) => {
    const imgFile = event.target.files[0];
    setPreview(URL.createObjectURL(imgFile));
    setImage(imgFile);
  };
  const deleteFile = (event) => {
    URL.revokeObjectURL(preview);
    setPreview('');
    setImage([]);
  };

  const getPost = useCallback(async () => {
    await axios
      .get(`http://j6d204.p.ssafy.io/api/posts/${params.post_id}/`)
      .then((res) => {
        console.log(res.data);
        setPostData(res.data);
        setUserData(res.data.user);

        setTitle(res.data.title);
        setContent(res.data.content);
      })
      .catch((err) => {
        console.log(err);
      });
  }, [params.post_pk]);

  // useEffect(() => {
  //   axios({
  //     method: 'get',
  //     url: `http://localhost:8000/posts/${params.post_pk}/`
  //   })
  //     .then((res) => {
  //       console.log(res.data)
  //       setPostData(res.data)

  //       setTitle(res.data.title)
  //       setContent(res.data.content)
  //     })
  //     .catch((err) => {
  //       console.log(err)
  //     })
  // }, [params.post_pk])

  useEffect(() => {
    getPost();
  }, [getPost, edit]);

  const editPost = (event) => {
    formData.append('image', image);
    formData.append('title', title);
    formData.append('content', content);
    event.preventDefault();

    axios({
      method: 'put',
      url: `http://j6d204.p.ssafy.io/api/posts/${params.post_id}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
      data: formData,
    })
      .then((res) => {
        console.log(res);
        setEdit(false);
        // navigate(`/community/${params.post_pk}/`)
      })
      .catch((err) => {
        console.log(err);
      })
      .then((res) => {
        console.log(res);
        setEdit(false);
        // navigate(`/community/${params.post_pk}/`)
      })
      .catch((err) => {
        console.log(err);
      });
  };

  const deletePost = () => {
    axios({
      method: 'delete',
      url: `http://j6d204.p.ssafy.io/api/posts/${params.post_id}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
    })
      .then((res) => {
        console.log(res);
        navigate('/community');
      })
      .catch((err) => {
        console.log(err);
      });
  };

  const cancel = () => {
    setEdit(false);
    setTitle(postData.title);
    setContent(postData.content);
  };

  return (
    <div>
      {edit ? (
        <div>
          <form className="">
            <div className="input-text">
              <label htmlFor="title_input">
                <h3>제목</h3>
              </label>
              <input
                className="write-title"
                type="text"
                name="title_input"
                value={title}
                onChange={titleHandle}
                placeholder="제목을 입력해 주세요."
              />
            </div>
            <div className="input-text">
              <label htmlFor="content_input">
                <h3>내용</h3>
              </label>
              <textarea
                className="write-textbox"
                name="content_input"
                value={content}
                onChange={contentHandle}
                placeholder="내용을 입력해 주세요."
              ></textarea>
            </div>
            <div className="input-text">
              <label htmlFor="image">
                <h3>이미지 첨부하기</h3>
              </label>
              <br />
              <input
                type="file"
                name="image"
                accept="image/*"
                onChange={loadFile}
              />
            </div>
          </form>
          <div>
            {preview && (
              <div className="upload_img">
                <img
                  style={{
                    width: '300px',
                    height: '300px',
                    objectFit: 'contain',
                  }}
                  alt="upload_img"
                  src={preview}
                />
                <Button onClick={deleteFile} variant="outlined" color="error">
                  삭제
                </Button>
              </div>
            )}
          </div>
        </div>
      ) : (
        <div>
          <Container maxWidth="md">
            <Paper elevation={0}>
              <CardMedia></CardMedia>
              <Box
                sx={{
                  marginY: 2,
                }}
              >
                {postData.id}번 게시글
              </Box>
              <Box
                sx={{
                  display: 'flex',
                  flexDirection: 'row',
                  alignItems: 'center',
                  marginBottom: 3,
                }}
              >
                <Box>
                  <Avatar
                    alt=""
                    src={userData.profile_image}
                    sx={{ width: '50px', height: '50px' }}
                  />
                </Box>
                <Box className="post-user-margin">
                  <Typography component="div" fontWeight="fontWeightBold">
                    {userData.email}
                  </Typography>
                  <Typography>작성시간 : {postData.created_date}</Typography>
                </Box>
              </Box>
              <Box
                sx={{
                  marginBottom: 2,
                }}
              >
                <Typography component="div" variant="h4">
                  {postData.title}
                </Typography>
              </Box>
              <hr></hr>
              <Box>
                <Typography component="div">{postData.content}</Typography>
              </Box>
              {/* <div>좋아요 기능 보류? : {post_dummy_data.likes}</div> */}
              <img
                className="post-img"
                alt=""
                src={`http://j6d204.d.ssafy.io/backend/media${postData.image}`}
              />
              <Box></Box>
            </Paper>
          </Container>
        </div>
      )}
      {userData.email === localStorage.getItem('user') ? (
        edit ? (
          <div>
            <Link to="/community" style={{ textDecoration: 'none' }}>
              <Button variant="outlined">목록으로</Button>
            </Link>
            <Button onClick={editPost} variant="outlined" color="success">
              수정
            </Button>
            <Button onClick={cancel} variant="outlined" color="error">
              취소
            </Button>
          </div>
        ) : (
          <div>
            <Link to="/community" style={{ textDecoration: 'none' }}>
              <Button variant="outlined">목록으로</Button>
            </Link>
            <Button
              onClick={() => setEdit(true)}
              variant="outlined"
              color="success"
            >
              수정
            </Button>
            <Button onClick={deletePost} variant="outlined" color="error">
              삭제
            </Button>
          </div>
        )
      ) : (
        <Link to="/community">
          <button>목록으로</button>
        </Link>
      )}
      <Comment comment={postData} />
    </div>
  );
};

export default Post;
