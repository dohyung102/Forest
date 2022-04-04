import React, { useState } from 'react';
import axios from 'axios';
import { Box, Button, Typography } from '@mui/material';
import './Write.css'
const Write = () => {
  
  function toCommunity() {
    window.location.href = '/community'
  }
  
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
    setImage(imgFile)
  }
  const deleteFile = (event) => {
    URL.revokeObjectURL(preview)
    setPreview('')
    setImage([])
  }

  const write = (e) => {
    // console.log(image)
    formData.append('title', title)
    formData.append('content', content)
    formData.append('image', image)
    // console.log(formData)
    e.preventDefault()
    axios({
      method: 'post',
      url: 'http://localhost:8000/api/posts/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
        // "Content-Type": `multipart/form-data`
      },
      data: formData,
    })
      .then((res) => {
        console.log(res)
        toCommunity()
      })
      .catch((err) => {
        console.log(err)
      })
  }

  return (
    <div className=''>
      <Box 
        sx={{
          display: 'flex',
          flexDirection: 'row',
          alignItems: 'center',
          marginBottom: 3,
        }}
      >
        <Typography fontWeight="fontWeightBold"  variant="h4">
          글 작성
        </Typography>
      </Box>
      <form className=''>
        <div className='input-text'>
          <label htmlFor='title_input'>
            <h3>제목</h3>
          </label>
          <input className='write-title' type='text' name='title_input' value={title} onChange={ titleHandle } placeholder='제목을 입력해 주세요.'/>
        </div>
        <div className='input-text'>
          <label htmlFor='content_input'>
            <h3>내용</h3>
          </label>
          <textarea className='write-textbox' type='textarea' name='content_input' value={content} onChange={ contentHandle } placeholder='내용을 입력해 주세요.'></textarea>
        </div>
        <div className='input-text'>
          <label htmlFor='image' >
            <h3>이미지 첨부하기</h3>
          </label><br/>
          <input type='file' name='image' accept='image/*' onChange={ loadFile } />
        </div>
      </form>
      <div>
        {preview && (
          <div className='upload_img'>
            <img style={{width:'300px', height:'300px', objectFit:'contain' }} alt='upload_img' src={preview} />
            <button onClick={deleteFile}>삭제</button>
          </div>
        )}
      </div>
      <div>
        {/* <button><Link to='/community'>목록으로</Link></button> */}
        <Button onClick={ toCommunity } variant="outlined">목록으로</Button>
        <Button onClick={ write } variant="outlined" color='success'>글쓰기</Button>
      </div>
    </div>
  );
};

export default Write;