import React, { useState } from 'react';
import axios from 'axios';

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
      <p>posts</p>
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
      <div>
        {/* <button><Link to='/community'>목록으로</Link></button> */}
        <button onClick={ toCommunity }>목록으로</button>
        <button onClick={ write }>글쓰기</button>
      </div>
    </div>
  );
};

export default Write;