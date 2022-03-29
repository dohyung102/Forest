import React, { useState } from 'react';
import { Button } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

import './LoginSignup.css'

const Signup = ({history}) => {

  const navigate = useNavigate()

  const [email, setEmail] = useState('')
  const [nickname, setNickname] = useState('')
  const [password, setPassword] = useState('')
  const [passwordConfirm, setPasswordConfirm] = useState('')

  const [emailError, setEmailError] = useState(false)
  const [passwordError, setPasswordError] = useState(false)

  const [emailBtnCheck, setEmailBtnCheck] = useState(false)
  const [nicknameBtnCheck, setNicknameBtnCheck] = useState(false)

  const emailHandle = (event) => {
    const emailInput = event.target.value
    setEmail(emailInput)
    // /---/ => ---가 순서대로 나타나야
    // [0-9] 0에서 9까지 / [a-z] a에서 z까지 / [-_\.] 해당 문자 허용
    // ? 앞의 표현식이 0 or 1회 등장
    const emailValid = /^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i

    if (!emailValid.test(emailInput))
      setEmailError(true)
    else
      setEmailError(false)
  }
  const nicknameHandle = (event) => {
    setNickname(event.target.value)
  }
  const passwordHandle = (event) => {
    setPassword(event.target.value)
  }
  const passwordConfirmHandle = (event) => {
    const passwordConfirmInput = event.target.value
    setPasswordConfirm(passwordConfirmInput)

    if (passwordConfirmInput !== password)
      setPasswordError(true)
    else
      setPasswordError(false)
  }

  const emailCheck = () => {
    setEmailBtnCheck(true)
    alert('email checked')
  }
  const nicknameCheck = () => {
    setNicknameBtnCheck(true)
    alert('nickname checked')
  }
  
  const signup = () => {
    axios({
      method: 'post',
      url: 'http://localhost:8000/accounts/registraion/',
      data: {
        email: email,
        nickname: nickname,
        password: password,
      }
    })
      .then((res) => {
        console.log(res)
        alert('signup completed')
        navigate('/login')
      })
      .catch((err) => {
        console.log(err)
      })    
  }

  return (
    <div className='login-signup-flex'>
      <p>회원가입</p>
      <form className='login-signup-form'>
        <input 
          type='email' 
          name='email_input' 
          value={email} 
          onChange={ emailHandle } 
          placeholder='이메일' 
          className='login-signup-input'
        />
        {emailError && <div className='valid-alert'>이메일 형식이 올바르지 않습니다.</div>}
        <button 
          onClick={emailCheck}
          className={emailError || !email ? 'login-signup-button' : 'login-signup-button-active'}
          type='button'
          disabled={emailError || !email}
          >
          이메일 인증하기
        </button>
        <input 
          type='text' 
          name='nickname_input' 
          value={nickname} 
          onChange={ nicknameHandle } 
          placeholder='닉네임' 
          className='login-signup-input' 
        />
        <button 
          onClick={nicknameCheck} 
          className={!nickname ? 'login-signup-button' : 'login-signup-button-active'} 
          type='button' disabled={!nickname}
        >
          중복 확인
        </button>
        <input 
          type='password' 
          name='password_input' 
          value={password} 
          onChange={ passwordHandle } 
          placeholder='비밀번호' 
          className='login-signup-input' 
          autoComplete="on" 
        />
        <input 
          type='password' 
          name='passwordConfirm_input' 
          value={passwordConfirm} 
          onChange={ passwordConfirmHandle } 
          placeholder='비밀번호 확인' 
          className='login-signup-input' 
          autoComplete="on" 
        />
        {passwordError && <div className='valid-alert'>비밀번호가 일치하지 않습니다.</div>}
        <button 
          onClick={signup} 
          className={!emailBtnCheck || !nicknameBtnCheck || passwordError || !password || !passwordConfirm ? 'login-signup-button' : 'login-signup-button-active'} 
          type='button' 
          disabled={!emailBtnCheck || !nicknameBtnCheck || passwordError || !password || !passwordConfirm}
        >
          회원가입
        </button>
      </form>
      <div>
        <Button>이미 아이디가 있으신가요? / 아이디 찾기??</Button>
        <Button>뒤로가기?</Button>
      </div>
    </div>
  );
};

export default Signup;
