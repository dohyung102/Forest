import React, { useState, useEffect, useCallback } from 'react';
import axios from 'axios'
import { Link, useParams, useNavigate } from 'react-router-dom';

import './Post.css'
import Comment from './Comment'

const Post = () => {

  const navigate = useNavigate()
  const [postData, setPostData] = useState([])
  const [edit, setEdit] = useState(false)

  const params = useParams()
  // console.log(params)

  const [title, setTitle] = useState('')
  const [content, setContent] = useState('')
  const [preview, setPreview] = useState('')
  const [image, setImage] = useState('')
  const formData = new FormData()
  
  const titleHandle = (event) => {
    setTitle(event.target.value)
  }
  const contentHandle = (event) => {
    setContent(event.target.value)
  }
  const loadFile = (event) => {
    const imgFile = event.target.files[0]
    setPreview(URL.createObjectURL(imgFile))
    formData.append('image', imgFile)
  }
  const deleteFile = (event) => {
    URL.revokeObjectURL(preview)
    setPreview('')
    setImage([])
  }

  const getPost = useCallback(async () => {
    await axios.get(`http://localhost:8000/api/posts/${params.post_id}/`)
    .then((res) => {
      console.log(res.data)
      setPostData(res.data)
  
      setTitle(res.data.title)
      setContent(res.data.content)
    })
    .catch((err) => {
      console.log(err)
    })
  }, [params.post_pk])

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
    getPost()
  }, [getPost, edit])
    
  const editPost = (event) => {
    formData.append('title', title)
    formData.append('content', content)
    formData.append('image', image)
    event.preventDefault()

    axios({
      method: 'put',
      url: `http://localhost:8000/api/posts/${params.post_id}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      },
      data: formData,
    })
    .then((res) => {
      console.log(res)
      setEdit(false)
      // navigate(`/community/${params.post_pk}/`)
    })
    .catch((err) => {
      console.log(err)
    })
  }
  
  const deletePost = () => {
    axios({
      method: 'delete',
      url: `http://localhost:8000/api/posts/${params.post_id}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      }
    })
    .then((res) => {
      console.log(res)
      navigate('/community')
    })
    .catch((err) => {
      console.log(err)
    })
  }

  const cancel = () => {
    setEdit(false)
    setTitle(postData.title)
    setContent(postData.content)
  }
  
  return (
    <div>
      post page
      {edit
        ?
        <div>
          <form className=''>
            <div>
              <label htmlFor='title_input'>제목 </label>
              <input type='text' name='title_input' value={title} onChange={ titleHandle } placeholder='제목' className='' />
            </div>
            <div>
              <label htmlFor='content_input'>내용 </label>
              <input type='text' name='content_input' value={content} onChange={ contentHandle } placeholder='내용' className='' />
            </div>
            <div>
              <label htmlFor='image'>이미지 첨부하기 </label>
              <input type='file' name='image' accept='image/*' onChange={ loadFile } />
            </div>
          </form>
          <div>
            <p>업로드된 이미지</p>
            {preview && (
              <div className='upload_img'>
                <img style={{width:'300px', height:'300px', objectFit:'contain' }} alt='upload_img' src={preview} />
                <button onClick={deleteFile}>삭제</button>
              </div>
            )}
          </div>
        </div>
        :
        <div>
          <div>{postData.id}번 게시글</div>
          {/* <div>좋아요 기능 보류? : {postData.likes}</div> */}
          <div>작성자 {postData.user}</div>
          <div>{postData.title}</div>
          <div>{postData.content}</div>
          <img className='post-img' alt='' src={postData.image} />
          <div>작성일자 : {postData.created_date}</div>
        </div>
      }
      {postData.user === localStorage.getItem('user')
        ?
        edit
          ?
          <div>
            <Link to='/community'><button>목록으로</button></Link>
            <button onClick={editPost}>수정하기</button>
            <button onClick={cancel}>취소하기</button>
          </div>
          :
          <div>
            <Link to='/community'><button>목록으로</button></Link>
            <button onClick={() => setEdit(true)}>수정하기</button>
            <button onClick={deletePost}>삭제하기</button>
          </div>
        
        :
        <Link to='/community'><button>목록으로</button></Link>
      }
      <Comment comment={postData} />
    </div>
  );
};

export default Post;