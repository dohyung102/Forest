import React, { useState, useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import axios from 'axios'
import Divider from '@mui/material/Divider';

import './Seller.css'

const Seller = () => {

  const navigate = useNavigate()
  const { state } = useLocation()
  const [name, setName] = useState('')
  const [description, setDescription] = useState('')
  const [preview, setPreview] = useState('')
  const [image, setImage] = useState('')
  const formData = new FormData()

  const nameHandle = (event) => {
    const nameInput = event.target.value;
    setName(nameInput);
  };
  const descriptionHandle = (event) => {
    const descriptionInput = event.target.value;
    setDescription(descriptionInput);
  };
  const loadFile = (event) => {
    const imgFile = event.target.files[0];
    setPreview(URL.createObjectURL(imgFile));
    setImage(imgFile);
  };
  const deleteFile = (event) => {
    URL.revokeObjectURL(preview);
    setPreview('');
    setImage([]);
  };

  useEffect(() => {
    if (state) {
      setName(state.name)
      setDescription(state.description)
      const img = state.profile_image
      console.log(img)
      setPreview(img)
      // setImage([img])
      // console.log('image',image)cd f
    }
  }, [state])

  const createStore = (event) => {
    formData.append('name', name);
    formData.append('description', description);
    formData.append('profile_image', image);
    event.preventDefault();

    axios({
      method: 'post',
      url: 'http://j6d204.p.ssafy.io/api/stores/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
      data: formData,
    })
      .then((res) => {
        console.log(res);
        localStorage.setItem('store', res.data.id);
        navigate(`/store/${res.data.id}`);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  const editStore = (event) => {
    formData.append('name', name)
    formData.append('description', description)
    if (image)
      formData.append('profile_image', image)
    event.preventDefault()

    axios({
      method: 'put',
      url: `http://j6d204.p.ssafy.io/api/stores/${state.id}/`,
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
      {state
        ?
        <div className='seller-title'>????????? ??????</div>
        :
        <div className='seller-title'>????????? ??????</div>
      }
      <Divider sx={{my: 4}} variant="middle" light />
      <form>
        <div className='seller-div'>
          <label 
            className='seller-label'
            htmlFor="name">????????????</label>
          <input
            className="seller-input"
            type="text"
            name="name"
            value={name}
            onChange={nameHandle}
            placeholder="????????????"
          />
        </div>
        <div className='seller-div'>
          <label 
            className='seller-label'
            htmlFor="description">???????????????</label>
          <textarea
            className="seller-input-area"
            type="textarea"
            name="description"
            value={description}
            onChange={descriptionHandle}
            placeholder="???????????????"
          />
        </div>
        <div className='seller-div'>
          <label 
            className='seller-label'
            htmlFor="image">????????? ????????????</label>
          <input
            className="seller-input"
            type="file"
            name="image"
            accept="image/*"
            onChange={loadFile}
          />
        </div>
        {preview && (
          <div className='seller-div'>
            <div className='seller-label'>???????????? ?????????</div>
            <div className="upload_img">
              <img
                style={{
                  width: '300px',
                  height: '300px',
                  objectFit: 'contain',
                }}
                alt="upload_img"
                src={preview}
              />
              <button onClick={deleteFile}>??????</button>
            </div>
          </div>
        )}
        <Divider sx={{my: 4}} variant="middle" light />
        {state
          ?
          <button className='seller-btn' onClick={editStore}>????????????</button>
          :
          <button className='seller-btn' onClick={createStore}>????????????</button>
        }
      </form>
    </div>
  );
};

export default Seller;
