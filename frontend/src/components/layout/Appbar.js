import React from 'react';
// import style from './style.scss'
import './style.css'

import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import IconButton from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import Menu from '@mui/material/Menu';
import MenuIcon from '@mui/icons-material/Menu';
import Container from '@mui/material/Container';
import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import Tooltip from '@mui/material/Tooltip';
import MenuItem from '@mui/material/MenuItem';



const Appbar = () => {

  return (
    <header className='layout-header'>
      <Container maxWidth='md' height='100%' disableGutters>
        {/* 웹 화면 */}
        <Box sx={{ mx: 1, my: 3, display: { xs: 'none', md: 'flex'}, justifyContent: 'space-between', alignItems: 'center' }}>
          <div className='pjt-name'>
            FOREST
          </div>
          <nav>
            <ul className='layout-ul'>
              <li><Button>상품정보</Button></li>
              <li><Button>식물</Button></li>
              <li><Button>상품정보</Button></li>
              <li><Button>상품정보</Button></li>
              <li><Button>로그인</Button></li>
              <li><Button>회원가입</Button></li>
            </ul>
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