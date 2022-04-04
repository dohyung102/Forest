import React, { useEffect, useState, useCallback } from 'react';
import axios from 'axios'
import { useNavigate } from 'react-router-dom';
import { Grid } from '@mui/material';

import './Community.css'

// 참고 링크
// https://slog.website/post/8
// https://ghur2002.medium.com/react%EC%97%90%EC%84%9C-infinite-scroll-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0-128d64ea24b5
// https://velog.io/@hyounglee/TIL-56


const Community = () => {

  function toPost(e) {
    window.location.href = '/community/write'
  }

  // eslint-disable-next-line no-unused-vars
  const [posts, setPosts] = useState([])
  // eslint-disable-next-line no-unused-vars
  const [page, setPage] = useState(1)
  // eslint-disable-next-line no-unused-vars
  const [loading, setLoading] = useState(false)


  const [preItems, setPreItems] = useState(0)
  const [items, setItems] = useState(9)

  const getPosts = useCallback(async () => {
    setLoading(true)
    await axios.get('http://localhost:8000/api/posts/')
    .then((res) => {
      // console.log(res.data.reverse())
      res.data.reverse()
      setPosts(prevState => [...prevState, ...res.data.slice(preItems, items)])
      // setPosts(prevState => [...prevState, ...res.data.results])
    })
    setLoading(false)
  }, [preItems, items])

  const scrollHandle = () => {
    const scrollHeight = document.documentElement.scrollHeight
    const scrollTop = document.documentElement.scrollTop
    const clientHeight = document.documentElement.clientHeight
    if (scrollHeight - scrollTop === clientHeight && !loading) {

      setPreItems(items)
      setItems(items => items + 9)

      setPage(page => page + 1)
    }
  }

  const navigate = useNavigate()
  const linkToPostDetail = (index) => {
    navigate(`/community/${index}`, { state: index })
  }

  useEffect(() => {
    getPosts()
  }, [getPosts])

  useEffect(() => {
    window.addEventListener('scroll', scrollHandle)
    return () => {
      window.removeEventListener('scroll', scrollHandle)
    }
  })



  return (
    <div>
      <div>
        <p className='community-title'>
          커뮤니티
        </p>
        <button className='community-btn' onClick={ toPost }>글쓰기</button>
      </div>

      {posts.map((post) => {
        return (
            <Grid 
              container 
              spacing={0}
              my={1}
              sx={{
                // backgroundColor: 'grey.200',
                border: 1, 
                borderRadius: '20px',
                // borderTop:1, 
                // borderBottom:1, 
                borderColor: 'grey.200' 
              }}
              // justifyContent='center' direction='column'
              style={{ height: '110px' }}
              onClick={(e) => {linkToPostDetail(post.id, e)}}
              key={post.id}
            >
              {/* 좋아요 */}
              <Grid item md={2}>
                {/* {post.likes} */}
              </Grid>
              {/* 이미지 */}
              { post.image && 
                <Grid item md={2}>
                  <img className='community-post-img' src={post.image} alt='post_img' />
                </Grid>
              }
              {/* 컨텐츠 */}
              { post.image
                ?
                <Grid item md={7}>
                  <div style={{ display:'flex',flexDirection:'column', justifyContent:'center' }}>
                    <div>{post.id}번 게시글</div>
                    <div>{post.title}</div>
                    <div>{post.content}</div>
                  </div>
                </Grid>
                :
                <Grid item md={9}>
                  <div style={{ display:'flex',flexDirection:'column', justifyContent:'center' }}>
                    <div>{post.id}번 게시글</div>
                    <div>{post.title}</div>
                    <div>{post.content}</div>
                  </div>
                </Grid>
              }
            </Grid>
        )
      })}
      
      {/* <div className='community-footer'>
        footer
      </div> */}
    </div>
  );
};

export default Community;
