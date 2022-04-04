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
        <li onClick={(e) => {profileNavigate('', e)}}>프로필</li>
        <li onClick={(e) => {profileNavigate('/posts', e)}}>내 글</li>
        <li onClick={(e) => {profileNavigate('/comments', e)}}>내 댓글</li>
      </ul>
    </div>
  );
};

export default MypageNavigation;