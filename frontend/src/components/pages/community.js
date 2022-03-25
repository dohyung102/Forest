import React, { useEffect } from 'react';
import { Link } from 'react-router-dom';
import { axios }

import { Grid } from '@mui/material';

import './Community.css'

const Community = () => {

  function toPost(e) {
    window.location.href = '/post'
  }

  const getPosts = () => {
    const API_url = 'https://api.pexels.com/v1/'
    // console.log(API_url)
    return 
  }

  const scrollHandle = () => {
    const scrollHeight = document.documentElement.scrollHeight
    const scrollTop = document.documentElement.scrollTop
    const clientHeight = document.documentElement.clientHeight
    if (scrollHeight - scrollTop === clientHeight)
      console.log('page end')
  }

  useEffect(() => {
    window.addEventListener('scroll', scrollHandle)
    return () => {
      window.removeEventListener('scroll', scrollHandle)
    }
  })

  const dummy_posts = [
    {
      'idx':'1',
      'title':'aaaaa',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlL3VzZXJzLzE3MzU2OS9wbGFudC1waG90b3MvTm9uZS8xNjQ3NzA2MzY2NTE1LTIyNEJCNzlGLUFBMUQtNDY0Qi04MjI2LUNERjI4QUU0NkE3NC5qcGVn?format=pjpeg&optimize=medium&auto=webp&precrop=1080:1080,smart&fit=crop&width=1080&height=1080',
      'created_at':'2022-03-23 16:20',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'2',
      'title':'bbbbb',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 16:30',
      'likes':'2',
      'user':'user_aa'
    },
    {
      'idx':'3',
      'title':'ccc',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'https://media.wired.com/photos/5d8aab8bef84070009028d31/master/pass/Plant-Music-1162975190.jpg',
      'created_at':'2022-03-23 17:20',
      'likes':'4',
      'user':'user_aa'
    },
    {
      'idx':'4',
      'title':'ddddddd',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'5',
      'title':'eeeeeeeeee',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'6',
      'title':'ffffff',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'7',
      'title':'ccc',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'https://media.wired.com/photos/5d8aab8bef84070009028d31/master/pass/Plant-Music-1162975190.jpg',
      'created_at':'2022-03-23 17:20',
      'likes':'4',
      'user':'user_aa'
    },
    {
      'idx':'8',
      'title':'ddddddd',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'9',
      'title':'eeeeeeeeee',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'10',
      'title':'ffffff',
      'content':'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
      'img':'',
      'created_at':'2022-03-23 18:30',
      'likes':'0',
      'user':'user_aa'
    },
    {
      'idx':'11',
      'title':'gggggggggggg',
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
      {dummy_posts.map(post => {
        return (
          <Grid container spacing={0} sx={{ borderTop:1, borderColor: 'grey.300' }}
            // justifyContent='center' direction='column'
            key={post.idx} style={{ height: '110px' }}
          >
            {/* 좋아요 */}
            <Grid item md={2}>
              {post.likes}
            </Grid>
            {/* 이미지 */}
            { post.img && 
              <Grid item md={2}>
                <img className='community-post-img' src={post.img} />
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
        )
      })}
    </div>
  );
};

export default Community;