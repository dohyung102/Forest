import React, { useState, useEffect } from 'react';
// import { useRecoilValue } from 'recoil'
// import { idState } from './state'
import './style.css'
import { Link } from 'react-router-dom';

import Box from '@mui/material/Box';
import MenuIcon from '@mui/icons-material/Menu';
import Container from '@mui/material/Container';
import Button from '@mui/material/Button';



const Appbar = () => {

  const [auth, setAuth] = useState(false)

  useEffect(() => {
    // if (localStorage.getItem('token'))
    if (localStorage.getItem('token'))
      setAuth(true)
  }, [])

  const homeButton = () => {
    window.location.replace('/')
  }

  const logout = () => {
    localStorage.clear()
  }

  return (
    <header className='layout-header'>
      <Container maxWidth='md' height='100%' disableGutters>
        {/* 웹 화면 */}
        <Box sx={{ mx: 1, my: 3, display: { xs: 'none', md: 'flex'}, justifyContent: 'space-between', alignItems: 'center' }}>
          <div className='pjt-name' onClick={ homeButton }>
            FOREST
          </div>
          <nav>
            {
              auth
              ?
              <ul className='layout-ul'>
                <li><Button style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }}>상품등록</Button></li>
                <li><Button style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }}>상품정보</Button></li>
                <li><Button style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }} component={Link} to='/search'>식물검색</Button></li>
                <li><Button style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }} component={Link} to='/community'>커뮤니티</Button></li>
                <li><Button onClick={logout} style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }}>로그아웃</Button></li>
                <li><Button style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }} component={Link} to='/mypage'>마이페이지</Button></li>
              </ul>
              :
              <ul className='layout-ul'>
                <li><Button style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }} component={Link} to='/store'>스토어</Button></li>
                <li><Button style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }} component={Link} to='/search'>식물검색</Button></li>
                <li><Button style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }} component={Link} to='/community'>커뮤니티</Button></li>
                <li><Button style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }} component={Link} to='/login'>로그인</Button></li>
                <li><Button style={{ fontWeight: 'bold', fontSize: '16px', color: 'gray' }} component={Link} to='/signup'>회원가입</Button></li>
              </ul>
            }
          </nav>
          {/* <div>userinfo</div> */}
        </Box>

        {/* 모바일 화면 */}
        <Box sx={{ display: { xs: 'flex', md: 'none'}}}>
          <MenuIcon />
          <div></div>
          <div className='pjt-name'>
            FOREST
          </div>
        </Box>
      </Container>
    </header>
  );
};

export default Appbar;