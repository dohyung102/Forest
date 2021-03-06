import React, { useState } from 'react';
// import { Button } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

import './LoginSignup.css';

const Signup = ({ history }) => {
  const navigate = useNavigate();

  const [email, setEmail] = useState('');
  const [nickname, setNickname] = useState('');
  const [password, setPassword] = useState('');
  const [passwordConfirm, setPasswordConfirm] = useState('');
  // eslint-disable-next-line no-unused-vars
  const [gender, setGender] = useState('');

  const [emailError, setEmailError] = useState(false);
  const [passwordError, setPasswordError] = useState(false);
  const [passwordValidError, setPasswordValidError] = useState(false);

  const [emailBtnCheck, setEmailBtnCheck] = useState(false);
  const [nicknameBtnCheck, setNicknameBtnCheck] = useState(false);

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
  const nicknameHandle = (event) => {
    setNickname(event.target.value);
  };
  const passwordHandle = (event) => {
    const pwInput = event.target.value
    setPassword(pwInput);
    const pwValid = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;

    if (!pwValid.test(pwInput)) setPasswordValidError(true)
    else setPasswordValidError(false);
  };
  const passwordConfirmHandle = (event) => {
    const passwordConfirmInput = event.target.value;
    setPasswordConfirm(passwordConfirmInput);

    if (passwordConfirmInput !== password) setPasswordError(true);
    else setPasswordError(false);
  };

  const emailCheck = () => {
    setEmailBtnCheck(true);
    alert('이메일 확인 완료');
  };
  const nicknameCheck = () => {
    setNicknameBtnCheck(true);
    alert('닉네임 확인 완료');
  };

  const signup = () => {
    axios({
      method: 'post',
      url: 'http://j6d204.p.ssafy.io/api/users/signup/',
      data: {
        email: email,
        nickname: nickname,
        password1: password,
        password2: passwordConfirm,
        gender: gender,
      },
    })
      .then((res) => {
        console.log(res);
        alert('회원가입 성공');
        navigate('/login');
      })
      .catch((err) => {
        console.log(err);
      });
  };

  return (
    <div className="login-signup-flex">
      <div className='login-signup-title'>회원가입</div>
      <form className="login-signup-form">
        <input
          type="email"
          name="email_input"
          value={email}
          onChange={emailHandle}
          placeholder="이메일"
          className="login-signup-input"
        />
        {emailError && (
          <div className="valid-alert">이메일 형식이 올바르지 않습니다.</div>
        )}
        <button
          onClick={emailCheck}
          className={
            emailError || !email
              ? 'login-signup-button'
              : 'login-signup-button-active'
          }
          type="button"
          disabled={emailError || !email}
        >
          이메일 인증하기
        </button>
        <input
          type="text"
          name="nickname_input"
          value={nickname}
          onChange={nicknameHandle}
          placeholder="닉네임"
          className="login-signup-input"
        />
        <button
          onClick={nicknameCheck}
          className={
            !nickname ? 'login-signup-button' : 'login-signup-button-active'
          }
          type="button"
          disabled={!nickname}
        >
          중복 확인
        </button>
        <input
          type="password"
          name="password_input"
          value={password}
          onChange={passwordHandle}
          placeholder="비밀번호"
          className="login-signup-input"
          autoComplete="on"
        />
        {passwordValidError&& (
          <div className="valid-alert">영문과 숫자를 포함하여 8자리 이상 작성하여 주세요.</div>
        )}
        <input
          type="password"
          name="passwordConfirm_input"
          value={passwordConfirm}
          onChange={passwordConfirmHandle}
          placeholder="비밀번호 확인"
          className="login-signup-input"
          autoComplete="on"
        />
        {passwordError && (
          <div className="valid-alert">비밀번호가 일치하지 않습니다.</div>
        )}
        <button
          onClick={signup}
          className={
            !emailBtnCheck ||
            !nicknameBtnCheck ||
            passwordError ||
            !password ||
            !passwordConfirm
              ? 'login-signup-button'
              : 'login-signup-button-active'
          }
          type="button"
          disabled={
            !emailBtnCheck ||
            !nicknameBtnCheck ||
            passwordError ||
            passwordValidError ||
            !password ||
            !passwordConfirm
          }
        >
          회원가입
        </button>
      </form>
      {/* <div>
        <Button>이미 아이디가 있으신가요? / 아이디 찾기??</Button>
        <Button>뒤로가기?</Button>
      </div> */}
    </div>
  );
};

export default Signup;
