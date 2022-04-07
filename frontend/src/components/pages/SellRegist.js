import React, { useState, useEffect } from 'react';
// import Calendar from 'react-calendar';
// import moment from 'moment';
import { useNavigate } from 'react-router-dom';
import { Divider, Autocomplete } from '@mui/material';
import LocalizationProvider from '@mui/lab/LocalizationProvider';
import DateAdapter from '@mui/lab/AdapterMoment';
// import MobileDatePicker from '@mui/lab/MobileDatePicker';
import DesktopDatePicker from '@mui/lab/DesktopDatePicker';
import TextField from '@mui/material/TextField';

import axios from 'axios';

import 'moment/locale/ko';
import './SellRegist.css'

const SellRegist = () => {
  
  const navigate = useNavigate()
  const [plant, setPlant] = useState('')
  const [name, setName] = useState('')
  const [price, setPrice] = useState()
  const [num, setNum] = useState()
  // const num = 1
  const [description, setDescription] = useState('')
  const [openDate, setOpenDate] = useState(new Date());
  const [closeDate, setCloseDate] = useState(new Date());
  const [preview, setPreview] = useState('');
  const [image, setImage] = useState('');
  const formData = new FormData();

  const [plantList, setPlantList] = useState()

  const nameHandle = (event) => {
    setName(event.target.value)
  }
  const priceHandle = (event) => {
    setPrice(event.target.value)
  }
  const numHandle = (event) => {
    setNum(event.target.value)
  }
  const descriptionHandle = (event) => {
    setDescription(event.target.value)
  }

  const openDateHandle = (value) => {
    // console.log('date', date)
    setOpenDate(value._d);
  };
  const closeDateHandle = (value) => {
    // const yyyy = value._d.getFullYear()
    // const mm = value._d.getMonth()+1
    // const dd = value._d.getDate()
    // const date = yyyy + '-'+ mm + '-' + dd
    // console.log('date', date)
    setCloseDate(value._d);
    // console.log(value._d);
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

  const toStore = (store_id) => {
    navigate(`/store/${toStore}`)
  }
    
  useEffect(() => {
    axios({
      method: 'get',
      url: 'http://j6d204.p.ssafy.io/api/plants/name/'
    })
    .then((res) => {
      // console.log(res.data)
      setPlantList(res.data)
    })
    .catch((err) => {
      console.log(err)
    })
  }, [])
  
  const createProduct = (event) => {
    event.preventDefault()
    const yyyyOpen = openDate.getFullYear()
    const mmOpen = openDate.getMonth()+1
    const ddOpen = openDate.getDate()
    const dateOpen = yyyyOpen + '-'+ mmOpen + '-' + ddOpen

    const yyyyClose = closeDate.getFullYear()
    const mmClose = closeDate.getMonth()+1
    const ddClose = closeDate.getDate()
    const dateClose = yyyyClose + '-'+ mmClose+ '-' + ddClose

    const store = localStorage.getItem('store')

    formData.append('name', name)
    formData.append('price', price)
    formData.append('num', num)
    formData.append('open_date', dateOpen)
    formData.append('close_date', dateClose)
    formData.append('description', description)
    formData.append('plant', plant)
    formData.append('store', store)
    if (image)
      formData.append('profile_image', image)
    // event.preventDefault()

    axios({
      method: 'post',
      url: 'http://j6d204.p.ssafy.io/api/products/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
      data: formData,
    })
      .then((res) => {
        console.log(res);
        navigate(`/store/${res.data.store}`)
      })
      .catch((err) => {
        console.log(err);
      });
  };
      
  return (
    <div>
      <div className='seller-title'>상품 등록</div>
      <Divider sx={{my: 4}} light variant="middle" />
      <form>
        {plantList &&
          <div className='seller-div'>
            <div className='seller-label'>식물 종류</div>
            <Autocomplete
              // selectOnFocus="true"
              onChange={(event, value) => setPlant(value.id)}
              disablePortal
              id="plant-select-box"
              options={plantList}
              sx={{ width: 350 }}
              renderInput={(params) => (
                <TextField {...params} label=" 식물 이름" />
              )}
            />
          </div>
        }

        <div className='seller-div'>
          <label className='seller-label' htmlFor='name'>상품명</label>
          <input className='seller-input' type='text' name='name' value={name} onChange={nameHandle} placeholder=' 상품명' />
        </div>
        <div className='seller-div'>
          <label className='seller-label' htmlFor='price'>가격</label>
          <input className='seller-input' type='number' name='price' value={price} onChange={priceHandle} placeholder=' 상품 가격' />
        </div>
        <div className='seller-div'>
          <label className='seller-label' htmlFor='number'>수량</label>
          <input className='seller-input' type='number' name='number' value={num} onChange={numHandle} placeholder=' 상품 수량' />
        </div>



        {/* <div className='sellDate'>
          <span>판매기간 </span>
          <Calendar onChange={onChange} value={value} />
          <div className="text-gray-500 mt-4">
            {moment(value).format("YYYY년 MM월 DD일")} d
          </div>
        </div> */}
        <div className='seller-div'>
          <label className='seller-label'>판매 기간</label>
          <div>
            <LocalizationProvider dateAdapter={DateAdapter}>
              <div className='seller-date'>
                <DesktopDatePicker
                  style={{ width: 350 }}
                  label="오픈 날짜"
                  inputFormat="yyyy/MM/DD"
                  mask="____/__/__"
                  value={openDate}
                  onChange={openDateHandle}
                  renderInput={(params) => <TextField sx={{width: 350}} {...params} />}
                  />
              </div>
              <div>
                <DesktopDatePicker
                  style={{ width: 350 }}
                  label="마감 날짜"
                  inputFormat="yyyy/MM/DD"
                  mask="____/__/__"
                  value={closeDate}
                  onChange={closeDateHandle}
                  renderInput={(params) => <TextField sx={{width: 350}} {...params} />}
                  />
              </div>
            </LocalizationProvider>
          </div>
        </div>

        <div className='seller-div'>
          <label 
            className='seller-label'
            htmlFor="description">상품 설명</label>
          <textarea
            className="seller-input-area"
            type="textarea"
            name="description"
            value={description}
            onChange={descriptionHandle}
            placeholder=" 상품 설명"
          />
        </div>
        <div className='seller-div'>
          <label 
            className='seller-label'
            htmlFor="image">이미지 첨부하기</label>
          <input
            className="seller-input"
            type="file"
            name="image"
            accept="image/*"
            onChange={loadFile}
          />
        </div>
        <div>
          {preview && (
            <div className="upload_img">
              <img
                style={{ width: '300px', height: '300px', objectFit: 'contain' }}
                alt="upload_img"
                src={preview}
              />
              <button onClick={deleteFile}>삭제</button>
            </div>
          )}
        </div>
        <button className='seller-btn' onClick={createProduct}>등록하기</button>
      </form>
    </div>
  )
}
export default SellRegist;