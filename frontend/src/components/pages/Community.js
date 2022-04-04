import React, { useEffect, useState, useCallback } from 'react';
// import axios from 'axios'
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';
import {
  Avatar,
  Box,
  Card,
  CardActionArea,
  Container,
  Divider,
  Grid,
  Typography,
} from '@mui/material';
import ThumbUpIcon from '@mui/icons-material/ThumbUp';
import ChatIcon from '@mui/icons-material/Chat';

import './Community.css';

// 참고 링크
// https://slog.website/post/8
// https://ghur2002.medium.com/react%EC%97%90%EC%84%9C-infinite-scroll-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0-128d64ea24b5
// https://velog.io/@hyounglee/TIL-56

const Community = () => {
  function toPost(e) {
    window.location.href = '/community/write';
  }

  // eslint-disable-next-line no-unused-vars
  const [posts, setPosts] = useState([]);
  // eslint-disable-next-line no-unused-vars
  const [page, setPage] = useState(1);
  // eslint-disable-next-line no-unused-vars
  const [loading, setLoading] = useState(false);

  const [preItems, setPreItems] = useState(0);
  const [items, setItems] = useState(9);

  const getPosts = useCallback(async () => {
    setLoading(true);
    await axios.get('http://localhost:8000/api/posts/').then((res) => {
      console.log(res.data);
      setPosts((prevState) => [
        ...prevState,
        ...res.data.slice(preItems, items),
      ]);
      // setPosts(prevState => [...prevState, ...res.data.results])
    });
    setLoading(false);
  }, [preItems, items]);

  const scrollHandle = () => {
    const scrollHeight = document.documentElement.scrollHeight;
    const scrollTop = document.documentElement.scrollTop;
    const clientHeight = document.documentElement.clientHeight;
    if (scrollHeight - scrollTop === clientHeight && !loading) {
      setPreItems(items);
      setItems((items) => items + 9);

      setPage((page) => page + 1);
    }
  };

  const navigate = useNavigate();
  const linkToPostDetail = (index) => {
    navigate(`/community/${index}`, { state: index });
  };

  useEffect(() => {
    getPosts();
  }, [getPosts]);

  useEffect(() => {
    window.addEventListener('scroll', scrollHandle);
    return () => {
      window.removeEventListener('scroll', scrollHandle);
    };
  });

  // return (
  //   <div>
  //     <Container maxWidth="md">
  //       community page
  //       {/* <button><Link to='/post'>글쓰기</Link></button> */}
  //       <button onClick={toPost}>글쓰기</button>
  //     </Container>
  //     <Container maxWidth="md">
  //       {/* {dummy_posts.map(post => { */}
  //       {dummy_posts.map((post, idx) => {
  //         return (
  //           <Link
  //             to={`/community/${dummy_posts.idx}`}
  //             style={{ textDecoration: 'none' }}
  //           >
  //             <Divider variant="middle" />
  //             <Card sx={{ width: '100%', display: 'flex' }}>
  //               <CardActionArea>
  //                 <Box
  //                   sx={{
  //                     display: 'flex',
  //                     flexDirection: 'row',
  //                     alignItems: 'center',
  //                   }}
  //                 >
  //                   <Box>
  //                     <Typography component="div">
  //                       <ThumbUpIcon />
  //                       <Typography component="span" variant="overline">
  //                         {post.likes}
  //                       </Typography>
  //                     </Typography>
  //                   </Box>
  //                   <Box>
  //                     <Avatar
  //                       variant="rounded"
  //                       alt=""
  //                       src={post.img}
  //                       sx={{ width: '80px', height: '80px' }}
  //                     />
  //                   </Box>
  //                   <Box>
  //                     <Typography component="div" variant="h5">
  //                       {post.title}
  //                     </Typography>
  //                     <Typography component="div" variant="h6">
  //                       {post.content}
  //                     </Typography>
  //                   </Box>
  //                 </Box>
  //               </CardActionArea>
  //             </Card>
  //           </Link>
  //         );
  //       })}
  //       {dummy_posts.map((post, idx) => {
  //         return (
  //           <Link to={`/community/${post.idx}`}>
  //             <Grid
  //               container
  //               spacing={0}
  //               sx={{ borderTop: 1, borderColor: 'grey.300' }}
  //               // justifyContent='center' direction='column'
  //               key={idx}
  //               style={{ height: '110px' }}
  //             >
  //               {/* 좋아요 */}
  //               <Grid item md={2}>
  //                 {post.likes}
  //               </Grid>
  //               {/* 이미지 */}
  //               {post.img && (
  //                 <Grid item md={2}>
  //                   <img
  //                     className="community-post-img"
  //                     src={post.img}
  //                     alt="post_img"
  //                   />
  //                 </Grid>
  //               )}
  //               {/* 컨텐츠 */}
  //               {post.img ? (
  //                 <Grid item md={7}>
  //                   <div
  //                     style={{
  //                       display: 'flex',
  //                       flexDirection: 'column',
  //                       justifyContent: 'center',
  //                     }}
  //                   >
  //                     <div>{post.title}</div>
  //                     <div>{post.content}</div>
  //                   </div>
  //                 </Grid>
  //               ) : (
  //                 <Grid item md={9}>
  //                   <div
  //                     style={{
  //                       display: 'flex',
  //                       flexDirection: 'column',
  //                       justifyContent: 'center',
  //                     }}
  //                   >
  //                     <div>{post.title}</div>
  //                     <div>{post.content}</div>
  //                   </div>
  //                 </Grid>
  //               )}
  //             </Grid>
  //           </Link>
  //         );
  //       })}
  //       {posts.map((post, idx) => {
  //         return (
  //           <div style={{ height: '45px' }} key={idx}>
  //             {post.title}
  //           </div>
  //         );
  //       })}
  //     </Container>

  return (
    <div>
      community page
      <button onClick={toPost}>글쓰기</button>
      {posts.map((post) => {
        return (
          <Grid
            container
            spacing={0}
            sx={{ borderTop: 1, borderColor: 'grey.300' }}
            // justifyContent='center' direction='column'
            style={{ height: '110px' }}
            onClick={(e) => {
              linkToPostDetail(post.id, e);
            }}
            key={post.id}
          >
            {/* 좋아요 */}
            <Grid item md={2}>
              {/* {post.likes} */}
            </Grid>
            {/* 이미지 */}
            {post.image && (
              <Grid item md={2}>
                <img
                  className="community-post-img"
                  src={post.image}
                  alt="post_img"
                />
              </Grid>
            )}
            {/* 컨텐츠 */}
            {post.image ? (
              <Grid item md={7}>
                <div
                  style={{
                    display: 'flex',
                    flexDirection: 'column',
                    justifyContent: 'center',
                  }}
                >
                  <div>{post.title}</div>
                  <div>{post.content}</div>
                </div>
              </Grid>
            ) : (
              <Grid item md={9}>
                <div
                  style={{
                    display: 'flex',
                    flexDirection: 'column',
                    justifyContent: 'center',
                  }}
                >
                  <div>{post.title}</div>
                  <div>{post.content}</div>
                </div>
              </Grid>
            )}
          </Grid>
        );
      })}
    </div>
  );
};

export default Community;
