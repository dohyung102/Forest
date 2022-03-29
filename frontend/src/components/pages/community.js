import React, { useEffect, useState, useCallback } from 'react';
import axios from 'axios'
import { Link } from 'react-router-dom';
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

  const [posts, setPosts] = useState([])
  const [page, setPage] = useState(1)
  const [loading, setLoading] = useState(false)


  const [preItems, setPreItems] = useState(0)
  const [items, setItems] = useState(9)

  // 무한 스크롤 API 이용 
  const API_url = 'https://api.themoviedb.org/3/movie/popular?api_key=7098d034bd3b550d66f794f9b58e3339&language=ko-KR&page='
  const getPosts = useCallback(async () => {
    setLoading(true)
    await axios.get(`${API_url}${page}`)
    .then((res) => {
      console.log(page)
      setPosts(prevState => [...prevState, ...res.data.results])
    })
    setLoading(false)
  }, [page])

  
  // dummy data 테스트용 무한스크롤
  const [testPosts, setTestPosts] = useState([])
  
  
  const testInfiniteScroll = () => {
    const dummy_result = dummy_posts.slice(preItems, items)

    setTestPosts(prevState => [...prevState, ...dummy_result])

  }
  
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

  useEffect(() => {
    // getPosts()
    // [getPosts]
    testInfiniteScroll()
    // [items]
  }, [items])

  useEffect(() => {
    window.addEventListener('scroll', scrollHandle)
    return () => {
      window.removeEventListener('scroll', scrollHandle)
    }
  })

  const dummy_posts = [
    {
      'idx':'1',
      'title':'1111',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlL3VzZXJzLzE3MzU2OS9wbGFudC1waG90b3MvTm9uZS8xNjQ3NzA2MzY2NTE1LTIyNEJCNzlGLUFBMUQtNDY0Qi04MjI2LUNERjI4QUU0NkE3NC5qcGVn?format=pjpeg&optimize=medium&auto=webp&precrop=1080:1080,smart&fit=crop&width=1080&height=1080',
      'created_at':'2022-03-23 16:20',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'2',
      'title':'22222',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 16:30',
      'likes':'2',
      'user':'user_aa'
    },
    {
      'idx':'3',
      'title':'3333',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'https://media.wired.com/photos/5d8aab8bef84070009028d31/master/pass/Plant-Music-1162975190.jpg',
      'created_at':'2022-03-23 17:20',
      'likes':'4',
      'user':'user_aa'
    },
    {
      'idx':'4',
      'title':'4444',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'5',
      'title':'5555',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'6',
      'title':'66666',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'7',
      'title':'7777',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'https://media.wired.com/photos/5d8aab8bef84070009028d31/master/pass/Plant-Music-1162975190.jpg',
      'created_at':'2022-03-23 17:20',
      'likes':'4',
      'user':'user_aa'
    },
    {
      'idx':'8',
      'title':'8888',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'9',
      'title':'9999',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'10',
      'title':'10101010',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'11',
      'title':'11111111',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'1',
      'title':'12121212',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlL3VzZXJzLzE3MzU2OS9wbGFudC1waG90b3MvTm9uZS8xNjQ3NzA2MzY2NTE1LTIyNEJCNzlGLUFBMUQtNDY0Qi04MjI2LUNERjI4QUU0NkE3NC5qcGVn?format=pjpeg&optimize=medium&auto=webp&precrop=1080:1080,smart&fit=crop&width=1080&height=1080',
      'created_at':'2022-03-23 16:20',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'2',
      'title':'131313',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 16:30',
      'likes':'2',
      'user':'user_aa'
    },
    {
      'idx':'3',
      'title':'141414',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'https://media.wired.com/photos/5d8aab8bef84070009028d31/master/pass/Plant-Music-1162975190.jpg',
      'created_at':'2022-03-23 17:20',
      'likes':'4',
      'user':'user_aa'
    },
    {
      'idx':'4',
      'title':'151515',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'5',
      'title':'161616',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'6',
      'title':'171717',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'7',
      'title':'181818',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'https://media.wired.com/photos/5d8aab8bef84070009028d31/master/pass/Plant-Music-1162975190.jpg',
      'created_at':'2022-03-23 17:20',
      'likes':'4',
      'user':'user_aa'
    },
    {
      'idx':'8',
      'title':'191919',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'9',
      'title':'202020',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'10',
      'title':'212121',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'11',
      'title':'222222',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
  ]

  return (
    <div>
      community page
      {/* <button><Link to='/post'>글쓰기</Link></button> */}
      <button onClick={ toPost }>글쓰기</button>
      {/* {dummy_posts.map(post => { */}
      {testPosts.map((post, idx) => {
        return (
          <Link to={`/community/${post.idx}`}>
            <Grid container spacing={0} sx={{ borderTop:1, borderColor: 'grey.300' }}
              // justifyContent='center' direction='column'
              key={idx} style={{ height: '110px' }}
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
          </Link>
        )
      })}
      {posts.map((post, idx) => {
        return(
          <div style={{height:'45px'}} key={idx}>{post.title}</div>
        )
      })}
    </div>
  );
};

export default Community;