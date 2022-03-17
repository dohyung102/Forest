import React, { useState } from 'react';
import { Button } from '@mui/material';

import './LoginSignup.css'

const Signup = () => {

  const [email, setEmail] = useState('')
  const [nickname, setNickname] = useState('')
  const [password, setPassword] = useState('')
  const [passwordConfirm, setPasswordConfirm] = useState('')

  const emailHandle = (event) => {
    setEmail(event.target.value)
  }
  const nicknameHandle = (event) => {
    setNickname(event.target.value)
  }
  const passwordHandle = (event) => {
    setPassword(event.target.value)
  }
  const passwordConfirmHandle = (event) => {
    setPasswordConfirm(event.target.value)
  }

  return (
    <div className='login-signup-flex'>
      <p>회원가입</p>
      <form className='login-signup-form'>
        <input type='email' name='email_input' value={email} onChange={ emailHandle } placeholder='이메일' className='login-signup-input' />
        <button className='login-signup-button' type='button'>이메일 인증하기</button>
        <input type='text' name='nickname_input' value={nickname} onChange={ nicknameHandle } placeholder='닉네임' className='login-signup-input' />
        <button className='login-signup-button' type='button'>중복 확인</button>
        <input type='password' name='password_input' value={password} onChange={ passwordHandle } placeholder='비밀번호' className='login-signup-input' autoComplete="on" />
        <input type='password' name='passwordConfirm_input' value={passwordConfirm} onChange={ passwordConfirmHandle } placeholder='비밀번호 확인' className='login-signup-input' autoComplete="on" />
        <button className='login-signup-button' type='button'>회원가입</button>
      </form>
      <div>
        <Button>이미 아이디가 있으신가요? / 아이디 찾기??</Button>
        <Button>뒤로가기?</Button>
      </div>
    </div>
  );
};

export default Signup;