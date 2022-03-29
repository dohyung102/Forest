import React, { useState } from 'react';

const Write = () => {
  
  function toCommunity(e) {
    window.location.href = '/community'
  }
  
  const [title, setTitle] = useState('')
  const [content, setContent] = useState('')
  const [file, setFile] = useState('')
  
  const titleHandle = (event) => {
    setTitle(event.target.value)
  }
  const contentHandle = (event) => {
    setContent(event.target.value)
  }
  const loadFile = (event) => {
    const imgFile = event.target.files[0]
    // console.log(imgFile)
    setFile(URL.createObjectURL(imgFile))
  }
  const deleteFile = (event) => {
    URL.revokeObjectURL(file)
    setFile('')
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
        {file && (
          <div className='upload_img'>
            <img style={{width:'300px', height:'300px', objectFit:'contain' }} alt='upload_img' src={file} />
            <button onClick={deleteFile}>삭제</button>
          </div>
        )}
      </div>
      <div>
        {/* <button><Link to='/community'>목록으로</Link></button> */}
        <button onClick={ toCommunity }>목록으로</button>
        <button>글쓰기</button>
      </div>
    </div>
  );
};

export default Write;