import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link, useNavigate } from 'react-router-dom';
import { Avatar, Button, Grid } from '@mui/material';

import './Mypage.css';
import Mynav from '../layout/MypageNavigation';
import { fontSize } from '@mui/system';

const Mypage = () => {
  const [userData, setUserData] = useState([]);

  const [email, setEmail] = useState('');
  const [id, setID] = useState('');
  const [nickname, setNickname] = useState('');
  const [gender, setGender] = useState('');
  const [pw, setPW] = useState('');
  const [birthday, setBirthday] = useState(1);
  const [profileImage, setProfileImage] = useState('');

  const [preview, setPreview] = useState('');
  const [image, setImage] = useState('');
  const formData = new FormData();

  const navigate = useNavigate();

  const [edit, setEdit] = useState(false);
  const editProfile = () => {
    // axios 이용해서 서버로 데이터 수정 요청
    axios({
      method: 'patch',
      // url: `http://localhost:8000/api/accounts/${id}/`,
      url: 'http://j6d204.p.ssafy.io/api/accounts/user/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
        // "Content-Type": `multipart/form-data`
      },
      data: {
        nickname: nickname,
        gender: gender,
        birthday: birthday,
      },
    });
    setEdit((edit) => !edit);
  };

  const [originalPW, setOriginalPW] = useState('');
  const [newPW, setNewPW] = useState('');
  const [newPWConfirm, setNewPWConfirm] = useState('');
  const [editPW, setEditPW] = useState(false);

  const editPassword = () => {
    // axios 이용해서 서버로 데이터 수정 요청
    setEditPW((editPW) => !editPW);
  };

  // const emailHandle = (event) => {
  //   setEmail(event.target.value)
  // }
  const nicknameHandle = (event) => {
    setNickname(event.target.value);
  };
  const genderHandle = (event) => {
    setGender(event.target.value);
  };
  const birthdayHandle = (event) => {
    setBirthday(event.target.value);
  };

  const pwHandle = (event) => {
    setPW(event.target.value);
  };

  const originalPWHandle = (event) => {
    setOriginalPW(event.target.value);
  };
  const newPWHandle = (event) => {
    setNewPW(event.target.value);
  };
  const newPWConfirmHandle = (event) => {
    setNewPWConfirm(event.target.value);
  };

  const loadFile = (event) => {
    const imgFile = event.target.files[0];
    setPreview(URL.createObjectURL(imgFile));
    setImage(imgFile);
  };

  const deleteFile = (event) => {
    URL.revokeObjectURL(preview);
    setPreview('');
    setImage('');
  };

  const addFile = (e) => {
    // formData.append('email', email)
    // formData.append('nickname', nickname)
    // formData.append('gender', gender)
    // formData.append('password',)
    formData.append('profile_image', image);
    e.preventDefault();
    axios({
      method: 'patch',
      url: `http://localhost:8000/api/accounts/user/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
        // "Content-Type": `multipart/form-data`
      },
      data: formData,
    })
      .then((res) => {
        console.log(res);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  const linkToSellerAuth = () => {
    navigate('/sellerauth');
  };
  const linkToSeller = () => {
    navigate('/seller');
  };
  const linkToStore = (store_id) => {
    navigate(`/store/${store_id}`);
  };

  useEffect(() => {
    axios({
      method: 'get',
      url: 'http://j6d204.p.ssafy.io/api/accounts/user/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
    })
      .then((res) => {
        console.log(res);
        setUserData(res.data);
        setEmail(res.data.email);
        setID(res.data.id);
        setNickname(res.data.nickname);
        setGender(res.data.gender);
        setBirthday(res.data.birthday);
        setProfileImage(res.data.profile_image);
      })
      .catch((err) => {
        console.log('error');
      });
  }, []);

  return (
    <Grid container>
      <Grid item md={12}>
        <h2 className="mypage-title">마이페이지</h2>
        <Mynav />
      </Grid>
      <Grid item container md={6} justifyContent='center'>
      <Avatar
        alt=""
        src={profileImage}
        sx={{ width: '250px', height: '250px' }}
      />
      </Grid>
      <Grid item md={6}>
        <div style={{fontSize:'20px', marginBottom:'20px'}}>기본정보</div>
        
        {/* 반복문으로 어떻게 출력 못할까? */}

        {edit ? (
          <form>
            <div style={{marginBottom:'5px'}}>
              <label htmlFor="email_input">이메일 : </label>
              {userData.email}
            </div>
            <div>
              <label htmlFor="nickname_input">닉네임 : </label>
              <input
                type="text"
                name="nickname_input"
                value={nickname}
                onChange={nicknameHandle}
                placeholder="닉네임"
                style={{height:'20px', width:'150px'}}
              />
            </div>
            <div>
              <label htmlFor="gender_input">성별 : </label>
              <input
                type="text"
                name="gender_input"
                value={gender}
                onChange={genderHandle}
                placeholder="M or W"
                style={{height:'20px', width:'50px'}}
              />
            </div>
            <div style={{marginBottom:'15px'}}>
              <label htmlFor="birth_input">생년월일 : </label>
              <input
                type="text"
                name="birth_input"
                value={birthday || ''}
                onChange={birthdayHandle}
                placeholder="YYYY-MM-DD"
                style={{height:'20px', width:'100px'}}
              />
            </div>
            <Button onClick={editProfile} variant="outlined" color='success' style={{marginBottom:'20px', marginRight:'10px'}}>수정</Button>
            <Button onClick={() => setEdit((edit) => !edit)} variant="outlined" color='error' style={{marginBottom:'20px'}}>취소</Button>
          </form>
        ) : (
          <div>
            <div style={{marginBottom:'5px'}}>
              <label htmlFor="email_input">이메일 : </label>
              {userData.email}
            </div>
            <div style={{marginBottom:'5px'}}>
              <label htmlFor="nickname_input">닉네임 : </label>
              {userData.nickname}
            </div>
            <div style={{marginBottom:'5px'}}>
              <label htmlFor="gender_input">성별 : </label>
              {userData.gender}
            </div>
            <div style={{marginBottom:'15px'}}>
              <label htmlFor="birth_input">생년월일 : </label>
              {userData.birthday}
            </div>
            <Button onClick={() => setEdit((edit) => !edit)} variant="outlined" style={{marginBottom:'20px'}}>
              프로필 수정
            </Button>
          </div>
        )}
        {userData.role ? (
          userData.store_set ? (
            <Link to={`/store/${userData.store_set}`} style={{ textDecoration: 'none' }}>
              <Button variant="outlined">내 스토어 보기</Button>
            </Link>
          ) : (
            <Button onClick={linkToSeller} variant="outlined">스토어 등록</Button>
          )
            ) : (
          <Button onClick={linkToSellerAuth} variant="outlined">판매자 신청</Button>
        )}
      </Grid>
      {/* <Grid item md={12}>
        <p>사용자 특성</p>
      </Grid> */}
    </Grid>
  );
};

export default Mypage;
