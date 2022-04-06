import React, { useState, useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import axios from 'axios'

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
      url: `http://localhost:8000/api/stores/${state.id}/`,
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
      <div>스토어 등록</div>
      <form>
        <div>
          <label htmlFor="name">브랜드명</label>
          <input
            type="text"
            name="name"
            value={name}
            onChange={nameHandle}
            placeholder="브랜드명"
          />
        </div>
        <div>
          <label htmlFor="description">브랜드 설명</label>
          <input
            type="text"
            name="description"
            value={description}
            onChange={descriptionHandle}
            placeholder="브랜드 설명"
          />
        </div>
        <div>
          <label htmlFor="image">이미지 첨부하기</label>
          <input
            type="file"
            name="image"
            accept="image/*"
            onChange={loadFile}
          />
        </div>
        {preview && (
          <div>
            <p>업로드된 이미지</p>
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
              <button onClick={deleteFile}>삭제</button>
            </div>
          </div>
        )}
        {state
          ?
          <button onClick={editStore}>수정하기</button>
          :
          <button onClick={createStore}>등록하기</button>
        }
      </form>
    </div>
  );
};

export default Seller;
