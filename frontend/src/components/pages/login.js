import React, { useState } from 'react';
import { Button } from '@mui/material';

import './LoginSignup.css'

const Login = () => {

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')

  const emailHandle = (event) => {
    // console.log(event.target.value)
    setEmail(event.target.value)
  }
  const passwordHandle = (event) => {
    // console.log(event.target.value)
    setPassword(event.target.value)
  }

  return (
    <div className='login-signup-flex'>
      <p>로그인</p>
      <form className='login-signup-form'>
        {/* <label htmlFor='email_input'>이메일 </label> */}
        <input type='text' name='email_input' value={email} onChange={ emailHandle } placeholder='이메일' className='login-signup-input' />
        {/* <label htmlFor='password_input'>PW: </label> */}
        <input type='password' name='password_input' value={password} onChange={ passwordHandle } placeholder='비밀번호' className='login-signup-input' autoComplete='on' />

        <button className='login-signup-button' type='button'>로그인</button>
      </form>
      <div>
        <Button>비밀번호 찾기</Button>
        <Button>회원가입</Button>
      </div>
      <p>or login with</p>
      <div>
        <Button>Naver 로그인 버튼</Button>
        <Button>Google 로그인 버튼</Button>
        <Button>Kakao 로그인 버튼</Button>
      </div>
    </div>
  );
};

export default Login;