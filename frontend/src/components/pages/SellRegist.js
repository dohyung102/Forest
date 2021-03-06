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
import './Seller.css'

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
      <div className='seller-title'>?????? ??????</div>
      <Divider sx={{my: 4}} light variant="middle" />
      <form>
        {plantList &&
          <div className='seller-div'>
            <div className='seller-label'>?????? ??????</div>
            <Autocomplete
              // selectOnFocus="true"
              onChange={(event, value) => setPlant(value.id)}
              disablePortal
              id="plant-select-box"
              options={plantList}
              sx={{ width: 350 }}
              renderInput={(params) => (
                <TextField {...params} label=" ?????? ??????" />
              )}
            />
          </div>
        }

        <div className='seller-div'>
          <label className='seller-label' htmlFor='name'>?????????</label>
          <input className='seller-input' type='text' name='name' value={name} onChange={nameHandle} placeholder=' ?????????' />
        </div>
        <div className='seller-div'>
          <label className='seller-label' htmlFor='price'>??????</label>
          <input className='seller-input' type='number' name='price' value={price} onChange={priceHandle} placeholder=' ?????? ??????' />
        </div>
        <div className='seller-div'>
          <label className='seller-label' htmlFor='number'>??????</label>
          <input className='seller-input' type='number' name='number' value={num} onChange={numHandle} placeholder=' ?????? ??????' />
        </div>



        {/* <div className='sellDate'>
          <span>???????????? </span>
          <Calendar onChange={onChange} value={value} />
          <div className="text-gray-500 mt-4">
            {moment(value).format("YYYY??? MM??? DD???")} d
          </div>
        </div> */}
        <div className='seller-div'>
          <div className='seller-label'>?????? ??????</div>
          <div>
            <LocalizationProvider dateAdapter={DateAdapter}>
              <div className='seller-date'>
                <DesktopDatePicker
                  style={{ width: 350 }}
                  label="?????? ??????"
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
                  label="?????? ??????"
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
            htmlFor="description">?????? ??????</label>
          <textarea
            className="seller-input-area"
            type="textarea"
            name="description"
            value={description}
            onChange={descriptionHandle}
            placeholder=" ?????? ??????"
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
        <div>
          {preview && (
            <div className="upload_img">
              <img
                style={{ width: '300px', height: '300px', objectFit: 'contain' }}
                alt="upload_img"
                src={preview}
              />
              <button onClick={deleteFile}>??????</button>
            </div>
          )}
        </div>
        <button className='seller-btn' onClick={createProduct}>????????????</button>
      </form>
    </div>
  )
}
export default SellRegist;