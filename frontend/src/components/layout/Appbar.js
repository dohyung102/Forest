import React, { useState } from 'react';
import './style.css'
import { Link } from 'react-router-dom';

import Box from '@mui/material/Box';
import MenuIcon from '@mui/icons-material/Menu';
import CloseIcon from '@mui/icons-material/Close';
import Container from '@mui/material/Container';
import Button from '@mui/material/Button';


const Appbar = () => {  
  const [menuButton, setMenu] = useState(false);  // 메뉴의 초기값을 false로 설정
  
  // const toggleMenu = () => {
  //       setMenu(menuButton => !menuButton); // on,off 개념 boolean
  // }
  return (
    <header className='layout-header'>
      <Container maxWidth='md' height='100%' disableGutters>
        {/* 웹 화면 */}
        <Box sx={{ mx: 1, my: 3, display: { xs: 'none', md: 'flex'}, justifyContent: 'space-between', alignItems: 'center' }}>
          <div className='pjt-name'>
            <Link to='/home'>FOREST</Link>
          </div>
          <nav>
            <ul className='layout-ul'>
              <li><Button style={{ fontweight: 'bold', fontsize: '16px', color: 'white' }}><Link to="/survey">설문조사</Link></Button></li>
              <li><Button style={{ fontweight: 'bold', fontsize: '16px', color: 'white' }}><Link to="/recommend">추천식물</Link></Button></li>
              <li><Button style={{ fontweight: 'bold', fontsize: '16px', color: 'white' }}><Link to="/sell_regist">판매상품 등록</Link></Button></li>
              <li><Button style={{ fontweight: 'bold', fontsize: '16px', color: 'white' }}>로그인</Button></li>
              <li><Button style={{ fontweight: 'bold', fontsize: '16px', color: 'white' }}>회원가입</Button></li>
              <li><Button style={{ fontweight: 'bold', fontsize: '16px', color: 'white' }}><Link to="/cart">장바구니</Link></Button></li>
            </ul>
          </nav>
          {/* <div>userinfo</div> */}
        </Box>

        {/* 모바일 화면 */}
        <div className="appbar">
          <Box sx={{ display: { xs: 'flex', md: 'none'}}}>
            
            <ul className="header-wrapper">
            <div>
              <MenuIcon onClick={()=> setMenu(!menuButton)}></MenuIcon>
            </div>
            <div className='pjt-name'>
              FOREST
            </div>
            
            </ul>
            <ul className={menuButton ? "show-menu" : "hide-menu"}>
              <br />
              <CloseIcon onClick={()=> setMenu(!menuButton)}></CloseIcon>
              <br /><br />
              <p>상품정보</p>
              <br></br>
              <p>식물정보</p>
              <br />
              <p>커뮤니티</p>
              <br />
              <p>로그인</p>
            </ul>
          </Box>
          
        </div>
      </Container>
    </header>
  );
};

export default Appbar;