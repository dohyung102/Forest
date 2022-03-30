import React, { useState, useEffect } from 'react';
import axios from 'axios'
import { Link, useLocation } from 'react-router-dom';

import './Post.css'

const Post = () => {

  const [postData, setPostData] = useState([])
  const { state } = useLocation()
  console.log(state)
  // const pk = ''

  useEffect(() => {
    axios({
      method: 'get',
      url: `http://localhost:8000/posts/${state}/`
    })
      .then((res) => {
        console.log(res.data)
        setPostData(res.data)
      })
      .catch((err) => {
        console.log(err)
      })
  }, [state])

  return (
    <div>
      post page
      <div>
        <div>{postData.id}번 게시글</div>
        {/* <div>좋아요 기능 보류? : {postData.likes}</div> */}
        <div>작성자 {postData.user}</div>
        <div>{postData.title}</div>
        <div>{postData.content}</div>
        <img className='post-img' alt='' src={postData.img} />
        <div>작성일자 : {postData.created_date}</div>
      </div>
      <Link to='/community'><button>목록으로</button></Link>
      <div>
        댓글목록
        <div>
          {postData.comment_set 
            &&
            postData.comment_set.map((comment) => {
            return(
              <div>
                {comment}
              </div>
            )
          })}
        </div>
      </div>
    </div>
  );
};

export default Post;