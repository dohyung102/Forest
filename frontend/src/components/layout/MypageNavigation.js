import React from 'react';
import { Link } from 'react-router-dom';

const MypageNavigation = () => {
  return (
    <div>
      <ul className='nav-ul'>
        <li><Link to='/mypage'>프로필</Link></li>
        <li><Link to='/mypage/posts'>내 글</Link></li>
        <li><Link to='/mypage/reviews'>내 리뷰</Link></li>
      </ul>
    </div>
  );
};

export default MypageNavigation;