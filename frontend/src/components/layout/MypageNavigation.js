import React from 'react';
import { useNavigate } from 'react-router-dom';

const MypageNavigation = () => {

  const navigate = useNavigate()
  const profileNavigate = (page) => {
    // navigate(`/mypage${page}`, { state: props.userData })
    navigate(`/mypage${page}`)
  }

  return (
    <div>
      <ul className='nav-ul'>
        <li onClick={() => {profileNavigate('')}}>프로필</li>
        <li onClick={() => {profileNavigate('/posts')}}>내 글</li>
        <li onClick={() => {profileNavigate('/comments')}}>내 댓글</li>
        <li onClick={() => {profileNavigate('/reviews')}}>내 리뷰</li>
      </ul>
    </div>
  );
};

export default MypageNavigation;