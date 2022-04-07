import React, { useState, useEffect } from 'react';
// import axios from 'axios';

import './style.css';

import Box from '@mui/material/Box';
import { Link, useNavigate } from 'react-router-dom';
// import AppBar from '@mui/material/AppBar';
// import Toolbar from '@mui/material/Toolbar';
import MenuIcon from '@mui/icons-material/Menu';
import Container from '@mui/material/Container';
// import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
// import Tooltip from '@mui/material/Tooltip';
// import MenuItem from '@mui/material/MenuItem';

const Appbar = () => {
  const [auth, setAuth] = useState(false);

  useEffect(() => {
    if (localStorage.getItem('token')) setAuth(true);
  }, [auth]);

  const homeButton = () => {
    window.location.replace('/');
  };

  const logout = () => {
    localStorage.clear();
    setAuth(false)
  };

  const navigate = useNavigate()
  const toLogin = () => {
    navigate('/login', { state: setAuth })
  }

  // const navigate = useNavigate()
  const btnStyle = {
    fontWeight: 'bold',
    fontSize: '16px',
    color: 'white',
  }

  return (
    // <AppBar sx={{ bgcolor: 'teal'}}>
      <div className='layout-header'>
        <Container maxWidth="md" height="100%" disableGutters>
          {/* 웹 화면 */}
          <Box
            sx={{
              mx: 1,
              my: 0,
              display: { xs: 'none', md: 'flex' },
              justifyContent: 'space-between',
              alignItems: 'center',
            }}
          >
            <div className="pjt-name" onClick={homeButton}>
              FOREST
            </div>
            <nav>
              {auth ? (
                <ul className="layout-ul">
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link}
                      to="/store"
                    >
                      스토어
                    </Button>
                  </li>
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link}
                      to="/search"
                    >
                      식물검색
                    </Button>
                  </li>
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link}
                      to="/community"
                    >
                      커뮤니티
                    </Button>
                  </li>
                  <li>
                    <Button
                      onClick={logout}
                      style={btnStyle}
                    >
                      로그아웃
                    </Button>
                  </li>
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link}
                      to="/mypage"
                    >
                      마이페이지
                    </Button>
                  </li>
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link} 
                      to="/cart"
                    >
                      장바구니
                    </Button>
                  </li>
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link} 
                      to="/survey"
                    >
                      설문조사
                    </Button>
                  </li>
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link} 
                      to="/recommend"
                    >
                      추천식물
                    </Button>
                  </li>
                </ul>
              ) : (
                <ul className="layout-ul">
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link}
                      to="/store"
                    >
                      스토어
                    </Button>
                  </li>
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link}
                      to="/search"
                    >
                      식물검색
                    </Button>
                  </li>
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link}
                      to="/community"
                    >
                      커뮤니티
                    </Button>
                  </li>
                  <li>
                    <Button
                      style={btnStyle}
                      // component={Link}
                      // to="/login"
                      onClick={toLogin}
                    >
                      로그인
                    </Button>
                  </li>
                  <li>
                    <Button
                      style={btnStyle}
                      component={Link}
                      to="/signup"
                    >
                      회원가입
                    </Button>
                  </li>
                </ul>
              )}
            </nav>
            {/* <div>userinfo</div> */}
          </Box>

          {/* 모바일 화면 */}
          <Box sx={{ display: { xs: 'flex', md: 'none' }, alignItems: 'center', justifyContent: 'center' }}>
            <MenuIcon fontSize='large' 
              sx={{ position: 'fixed', left:0, mx: 1 }}
              />
            <div className="pjt-name">FOREST</div>
          </Box>
        </Container>
      </div>
    // </AppBar>
  );
};

export default Appbar;
