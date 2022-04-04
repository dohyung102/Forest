import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios'

const Seller = () => {

  const navigate = useNavigate()
  const [name, setName] = useState('')
  const [description, setDescription] = useState('')
  const [preview, setPreview] = useState('')
  const [image, setImage] = useState('')
  const formData = new FormData()

  const nameHandle = (event) => {
    const nameInput = event.target.value
    setName(nameInput)
  }
  const descriptionHandle = (event) => {
    const descriptionInput = event.target.value
    setDescription(descriptionInput)
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

  const createStore = (event) => {
    formData.append('name', name)
    formData.append('description', description)
    formData.append('profile_image', image)
    event.preventDefault()

    axios({
      method: 'post',
      url: 'http://localhost:8000/api/stores/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
      data: formData,
    })
      .then((res) => {
        console.log(res)
        navigate(`/store/${res.data.id}`)
      })
      .catch((err) => {
        console.log(err)
      })
  }

  return (
    <div>
      사업자 등록
      <form>
        <div>
          <label htmlFor='name'>브랜드명</label>
          <input type='text' name='name' value={name} onChange={nameHandle} placeholder='브랜드명' />
        </div>
        <div>
          <label htmlFor='description'>브랜드 설명</label>
          <input type='text' name='description' value={description} onChange={descriptionHandle} placeholder='브랜드 설명' />
        </div>
        <div>
          <label htmlFor='image'>이미지 첨부하기</label>
          <input type='file' name='image' accept='image/*' onChange={ loadFile } />
        </div>
        {preview && (
          <div>
            <p>업로드된 이미지</p>
            <div className='upload_img'>
              <img style={{width:'300px', height:'300px', objectFit:'contain' }} alt='upload_img' src={preview} />
              <button onClick={deleteFile}>삭제</button>
            </div>
          </div>
        )}
        <button onClick={createStore}>등록하기</button>
      </form>
    </div>
  );
};

export default Seller;