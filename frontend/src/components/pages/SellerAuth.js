import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

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
      url: `http://localhost:8000/api/accounts/getrole/${localStorage.getItem(
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
      사업자 등록
      <form>
        <div>
          <label htmlFor="company">회사이름</label>
          <input
            type="text"
            name="company"
            value={company}
            onChange={companyHandle}
            placeholder="회사이름"
          />
        </div>
        <div>
          <label htmlFor="eid">사업자 등록번호</label>
          <input
            type="number"
            name="eid"
            value={EID}
            onChange={EIDHandle}
            placeholder="사업자 등록번호"
          />
        </div>

        <div>담당자 등록</div>
        <div>
          <label htmlFor="name">회사이름</label>
          <input
            type="text"
            name="name"
            value={name}
            onChange={nameHandle}
            placeholder="담당자 이름"
          />
        </div>
        <div>
          <label htmlFor="phone">담당자 연락처</label>
          <input
            type="number"
            name="phone"
            value={phone}
            onChange={phoneHandle}
            placeholder="담당자 연락처"
          />
        </div>
        <div>
          <label htmlFor="email">담당자 이메일</label>
          <input
            type="email"
            name="email"
            value={email}
            onChange={emailHandle}
            placeholder="담당자 이메일"
          />
        </div>
        <button onClick={getAuth}>등록하기</button>
      </form>
    </div>
  );
};

export default SellerAuth;
