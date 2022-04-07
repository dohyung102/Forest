import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import Divider from '@mui/material/Divider';

import './Seller.css'

const SellerAuth = () => {
  const navigate = useNavigate();
  const [company, setCompany] = useState('');
  const [EID, setEID] = useState('');
  const [name, setName] = useState('');
  const [phone, setPhone] = useState('');
  const [email, setEmail] = useState('');

  const companyHandle = (event) => {
    const companyInput = event.target.value;
    setCompany(companyInput);
  };

  const EIDHandle = (event) => {
    const EIDInput = event.target.value;
    setEID(EIDInput);
  };

  const nameHandle = (event) => {
    const nameInput = event.target.value;
    setName(nameInput);
  };

  const phoneHandle = (event) => {
    const phoneInput = event.target.value;
    setPhone(phoneInput);
  };

  const emailHandle = (event) => {
    const emailInput = event.target.value;
    setEmail(emailInput);
  };

  const getAuth = (event) => {
    event.preventDefault();
    axios({
      method: 'put',
      url: `http://j6d204.p.ssafy.io/api/accounts/getrole/${localStorage.getItem(
        'user_id'
      )}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
    })
      .then((res) => {
        console.log(res);
        alert('판매자 신청이 완료되었습니다.');
        // 판매자 등록화면으로
        navigate('/seller');
      })
      .catch((err) => {
        console.log(err);
      });
  };

  return (
    <div>
      <div className='seller-title'>판매자 신청</div>
      <Divider sx={{my: 4}} variant="middle" light />
      <form>
        <div className='seller-auth-title'>
          회사 정보
        </div>
        <div className='seller-div'>
          <label 
            className='seller-label'
            htmlFor="company">
            회사이름
          </label>
          <input
            className="seller-input"
            type="text"
            name="company"
            value={company}
            onChange={companyHandle}
            placeholder="회사이름"
          />
        </div>
        <div className='seller-div'>
          <label 
            className='seller-label'
            htmlFor="eid">
            사업자 등록번호
          </label>
          <input
            className="seller-input"
            type="number"
            name="eid"
            value={EID}
            onChange={EIDHandle}
            placeholder="사업자 등록번호"
          />
        </div>
        <Divider sx={{my: 4}} variant="middle" light />

        <div className='seller-auth-title'>담당자 정보</div>
        <div className='seller-div'>
          <label 
          className='seller-label'
            htmlFor="name">
            이름
          </label>
          <input
            className="seller-input"
            type="text"
            name="name"
            value={name}
            onChange={nameHandle}
            placeholder="이름"
          />
        </div>
        <div className='seller-div'>
          <label 
            className='seller-label'
            htmlFor="phone"
          >
            연락처
          </label>
          <input
            className="seller-input"
            type="text"
            name="phone"
            value={phone}
            onChange={phoneHandle}
            placeholder="연락처"
          />
        </div>
        <div className='seller-div'>
          <label 
            className='seller-label'
            htmlFor="email">
            이메일
          </label>
          <input
            className="seller-input"
            type="email"
            name="email"
            value={email}
            onChange={emailHandle}
            placeholder="이메일"
          />
        </div>
        <Divider sx={{my: 4}} variant="middle" light />
        <button className='seller-btn' onClick={getAuth}>등록하기</button>
      </form>
    </div>
  );
};

export default SellerAuth;
