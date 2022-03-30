import React from 'react';
import { Link, useNavigate } from 'react-router-dom';

const MypageNavigation = () => {

  // console.log('props',props.data)
  const navigate = useNavigate()

  const profileNavigate = (page) => {
    // navigate(`/mypage${page}`, { state: props.userData })
    navigate(`/mypage${page}`)
  }

  return (
    <div>
      <ul className='nav-ul'>
        <li><Link to='/mypage'>프로필</Link></li>
        <li><Link to='/mypage/posts'>내 글</Link></li>
        <li><Link to='/mypage/reviews'>내 댓글</Link></li>
        <li onClick={(e) => {profileNavigate('', e)}}>프로필</li>
        <li onClick={(e) => {profileNavigate('/posts', e)}}>내 글</li>
        <li onClick={(e) => {profileNavigate('/reviews', e)}}>내 댓글</li>
      </ul>
    </div>
  );
};

export default MypageNavigation;