import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Button } from '@mui/material';
import axios from 'axios';

import './LoginSignup.css';

const Login = () => {
  const navigate = useNavigate();

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const [emailError, setEmailError] = useState(false);

  const emailHandle = (event) => {
    const emailInput = event.target.value;
    setEmail(emailInput);

    // /---/ => ---가 순서대로 나타나야
    // [0-9] 0에서 9까지 / [a-z] a에서 z까지 / [-_\.] 해당 문자 허용
    // ? 앞의 표현식이 0 or 1회 등장
    const emailValid =
      /^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

    if (!emailValid.test(emailInput)) setEmailError(true);
    else setEmailError(false);
  };
  const passwordHandle = (event) => {
    setPassword(event.target.value);
  };

  const login = () => {
    axios({
      method: 'post',
      url: 'http://j6d204.p.ssafy.io/api/users/login/',
      data: {
        email: email,
        password: password,
      },
    })
      .then((res) => {
        if (res.data.access_token) {
          // console.log(res.data)
          localStorage.clear();
          localStorage.setItem('token', res.data.access_token);
          localStorage.setItem('user_id', res.data.user.id);
          localStorage.setItem('user', res.data.user.email);
          localStorage.setItem('role', res.data.user.role);
          localStorage.setItem('store', res.data.user.store_set);
        }
        alert('login success');
        navigate('/');
      })
      .catch((err) => {
        console.log(err);
      });
  };

  return (
    <div className="login-signup-flex">
      <p>로그인</p>
      <form className="login-signup-form">
        {/* <label htmlFor='email_input'>이메일 </label> */}
        <input
          type="text"
          name="email_input"
          value={email}
          onChange={emailHandle}
          placeholder="이메일"
          className="login-signup-input"
        />
        {/* <label htmlFor='password_input'>PW: </label> */}
        <input
          type="password"
          name="password_input"
          value={password}
          onChange={passwordHandle}
          placeholder="비밀번호"
          className="login-signup-input"
          autoComplete="on"
        />

        <button
          onClick={login}
          className={
            !emailError && password
              ? 'login-signup-button-active'
              : 'login-signup-button'
          }
          type="button"
          disabled={emailError || !password}
        >
          로그인
        </button>
      </form>
      <div>
        <Button>비밀번호 찾기</Button>
        <Link to="/signup">
          <Button>회원가입</Button>
        </Link>
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
