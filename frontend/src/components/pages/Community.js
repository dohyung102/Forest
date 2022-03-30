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

  // 무한 스크롤 API 이용 
  // eslint-disable-next-line no-unused-vars
  const API_url = 'https://api.themoviedb.org/3/movie/popular?api_key=7098d034bd3b550d66f794f9b58e3339&language=ko-KR&page='
  
  // getPosts
  // const getPosts = useCallback(async () => {
  //   setLoading(true)
  //   await axios.get(`${API_url}${page}`)
  //   .then((res) => {
  //     console.log(page)
  //     setPosts(prevState => [...prevState, ...res.data.results])
  //   })
  //   setLoading(false)
  // }, [page])
  const getPosts = useCallback(async () => {
    setLoading(true)
    await axios.get('http://localhost:8000/posts/')
    .then((res) => {
      console.log(res.data)
      setPosts(prevState => [...prevState, ...res.data.slice(preItems, items)])
      // setPosts(prevState => [...prevState, ...res.data.results])
    })
    setLoading(false)
  }, [preItems, items])

  
  // dummy data 테스트용 무한스크롤
  // const [testPosts, setTestPosts] = useState([])
  
  
  // eslint-disable-next-line react-hooks/exhaustive-deps
  // const testInfiniteScroll = () => {
  //   const dummy_result = dummy_posts.slice(preItems, items)

  //   setTestPosts(prevState => [...prevState, ...dummy_result])

  // }
  
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
    // [getPosts]
    // testInfiniteScroll()
    // [items]
  }, [getPosts])

  useEffect(() => {
    window.addEventListener('scroll', scrollHandle)
    return () => {
      window.removeEventListener('scroll', scrollHandle)
    }
  })



  return (
    <div>
      community page
      {/* <button><Link to='/post'>글쓰기</Link></button> */}
      <button onClick={ toPost }>글쓰기</button>
      {/* {dummy_posts.map(post => { */}
      {/* {testPosts.map((post, idx) => { */}
      {posts.map((post) => {
        return (
          // <Link to={`/community/${post.id}`} key={post.id} >
            <Grid 
              container 
              spacing={0} 
              sx={{ borderTop:1, borderColor: 'grey.300' }}
              // justifyContent='center' direction='column'
              style={{ height: '110px' }}
              onClick={(e) => {linkToPostDetail(post.id, e)}}
              key={post.id}
            >
              {/* 좋아요 */}
              <Grid item md={2}>
                {post.likes}
              </Grid>
              {/* 이미지 */}
              { post.img && 
                <Grid item md={2}>
                  <img className='community-post-img' src={post.img} alt='post_img' />
                </Grid>
              }
              {/* 컨텐츠 */}
              { post.img
                ?
                <Grid item md={7}>
                  <div style={{ display:'flex',flexDirection:'column', justifyContent:'center' }}>
                    <div>{post.title}</div>
                    <div>{post.content}</div>
                  </div>
                </Grid>
                :
                <Grid item md={9}>
                  <div style={{ display:'flex',flexDirection:'column', justifyContent:'center' }}>
                    <div>{post.title}</div>
                    <div>{post.content}</div>
                  </div>
                </Grid>
              }
            </Grid>
          // </Link>
        )
      })}
      {/* {posts.map((post, idx) => {
        return(
          <div style={{height:'45px'}} key={idx}>{post.title}</div>
        )
      })} */}
    </div>
  );
};

export default Community;
