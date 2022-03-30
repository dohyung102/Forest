import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Button, Grid } from '@mui/material';

import './Mypage.css'
import Mynav from '../layout/MypageNavigation'

const Mypage = () => {

  const [userData, setUserData] = useState([])
  
  const [file, setFile] = useState('')
  // const [email, setEmail] = useState('')
  const [id, setID] = useState('')
  const [nickname, setNickname] = useState('')
  const [gender, setGender] = useState('')
  const [birthday, setBirthday] = useState(1)

  const [edit, setEdit] = useState(false)
  const editProfile = () => {
    // axios 이용해서 서버로 데이터 수정 요청
    axios({
      method: 'patch',
      url: `http://localhost:8000/accounts/${id}/`,
      data: {
        nickname: nickname,
        gender: gender,
        birthday: birthday,
      }
    })
    setEdit((edit) => !edit)
  }
  
  const [originalPW, setOriginalPW] = useState('')
  const [newPW, setNewPW] = useState('')
  const [newPWConfirm, setNewPWConfirm] = useState('')
  const [editPW, setEditPW] = useState(false)
  
  const editPassword = () => {
    // axios 이용해서 서버로 데이터 수정 요청
    setEditPW((editPW) => !editPW)
  }

  // const emailHandle = (event) => {
  //   setEmail(event.target.value)
  // }
  const nicknameHandle = (event) => {
    setNickname(event.target.value)
  }
  const genderHandle = (event) => {
    setGender(event.target.value)
  }
  const birthdayHandle = (event) => {
    setBirthday(event.target.value)
  }

  const originalPWHandle = (event) => {
    setOriginalPW(event.target.value)
  }
  const newPWHandle = (event) => {
    setNewPW(event.target.value)
  }
  const newPWConfirmHandle = (event) => {
    setNewPWConfirm(event.target.value)
  }


  const loadFile = (event) => {
    const imgFile = event.target.files[0]
    setFile(URL.createObjectURL(imgFile))
  }

  const deleteFile = (event) => {
    URL.revokeObjectURL(file)
    setFile('')
  }

  const addFile = () => {
    axios({
      method: 'put',
      url: `http://localhost:8000/accounts/${id}/`,
      data: {
        profile_image: file
      }
    })
  }

  useEffect(() => {
    axios({
      method: 'get',
      url: 'http://localhost:8000/accounts/user/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      }
    })
      .then((res) => {
        console.log(res)
        setUserData(res.data)
        // setEmail(res.data.email)
        setID(res.data.id)
        setNickname(res.data.nickname)
        setGender(res.data.gender)
        setBirthday(res.data.birthday)
      })
      .catch((err) => {
        console.log('error')
      })
  }, [])

  return (
    <Grid container>
      <Grid item md={12}>
        <p className='mypage-title'>마이페이지</p>
        <Mynav />
      </Grid>
      <Grid item md={6}>
        {file 
          ?
          <div className='mypage-flex'>
            <img className='mypage-img' alt='upload_img' src={file} />
            <div>
              <button onClick={addFile}>수정</button>
              <button onClick={deleteFile}>삭제</button>
            </div>
          </div>
          :
          <div className='mypage-img'>
            이미지
          </div>
        }
        <form>
          <label htmlFor='image'>이미지 첨부하기 </label>
          <input type='file' name='image' accept='image/*' onChange={ loadFile } />
        </form>
      </Grid>
      <Grid item md={6}> 
        <p>기본정보</p>
        {/* 반복문으로 어떻게 출력 못할까? */}

        {edit
          ?
          <form>
            <div>
              <label htmlFor='email_input'>이메일 : </label>
              {/* <input type='email' name='email_input' value={email} onChange={ emailHandle } placeholder='이메일' /> */}
              { userData.email }
            </div>
            <div>
              <label htmlFor='nickname_input'>닉네임 : </label>
              <input type='text' name='nickname_input' value={nickname} onChange={ nicknameHandle } placeholder='닉네임' />
            </div>
            <div>
              <label htmlFor='gender_input'>성별 : </label>
              <input type='email' name='gender_input' value={gender} onChange={ genderHandle } placeholder='성별' />
            </div>
            <div>
              <label htmlFor='birth_input'>생년월일 : </label>
              <input type='email' name='birth_input' value={birthday ||''} onChange={ birthdayHandle } placeholder='생년월일' />
            </div>
            <Button onClick={editProfile}>수정</Button>
            <Button onClick={() => setEdit((edit) => !edit) }>취소</Button>
          </form>
          :
          <div>
            <div>
              <label htmlFor='email_input'>이메일 : </label>
              { userData.email }
            </div>
            <div>
              <label htmlFor='nickname_input'>닉네임 : </label>
              { userData.nickname }
            </div>
            <div>
              <label htmlFor='gender_input'>성별 : </label>
              { userData.gender }
            </div>
            <div>
              <label htmlFor='birth_input'>생년월일 : </label>
              { userData.birthday }
            </div>
            <Button onClick={() => setEdit((edit) => !edit) }>프로필 수정</Button>
          </div>
        }

        {editPW
          ?
          <form>
            <div>
              <label htmlFor='oriPW_input'>현재비밀번호 : </label>
              <input type='password' name='oriPW_input' value={originalPW} onChange={ originalPWHandle } placeholder='현재비밀번호' autoComplete='on' />
            </div>
            <div>
              <label htmlFor='newPW_input'>새 비밀번호 : </label>
              <input type='password' name='newPW_input' value={newPW} onChange={ newPWHandle } placeholder='새비밀번호' autoComplete='on' />
            </div>
            <div>
              <label htmlFor='newPWConfirm_input'>비밀번호확인 : </label>
              <input type='password' name='newPWConfirm_input' value={newPWConfirm} onChange={ newPWConfirmHandle } placeholder='비밀번호확인' autoComplete='on' />
            </div>
            <Button onClick={editPassword}>수정</Button>
            <Button onClick={() => setEditPW((editPW) => !editPW) }>취소</Button>
          </form>
          :
          <Button onClick={() => setEditPW((editPW) => !editPW) }>비밀번호 변경</Button>
        }
      </Grid>
      <Grid item md={12}>
        <p>사용자 특성</p>
      </Grid>
    </Grid>
  );
};

export default Mypage;
