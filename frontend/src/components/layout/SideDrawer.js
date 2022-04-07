import React, { useState, useEffect } from 'react';
import { Drawer, Box, Typography, IconButton, Button } from '@mui/material';
import { useNavigate, Link } from 'react-router-dom';
import MenuIcon from '@mui/icons-material/Menu'

const SideDrawer = () => {
  const [drawerOpen, setDrawerOpen] = useState(false)
  const [auth, setAuth] = useState(false);
  const navigate = useNavigate()

  const btnStyle = {
    fontWeight: 'bold',
    fontSize: '16px',
    color: 'black',
  }

  const logout = () => {
    localStorage.clear();
    setAuth(false)
  };

  const toLogin = () => {
    navigate('/login', {state: { set_auth: setAuth() }})
  }

  useEffect(() => {
    if (localStorage.getItem('token')) setAuth(true);
  }, [auth]);

  return (
    <>
      <IconButton size='large' onClick={() => setDrawerOpen(true)}>
        <MenuIcon fontSize='large' />
      </IconButton>
      <Drawer 
        anchor='left' 
        open={drawerOpen} 
        onClose={() => setDrawerOpen(false)}
        >
        <Box p={2} width='250px' textAlign='center' role='presentation'>
          {auth ? (
            <ul className="layout-mobile-ul">
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
        </Box>
      </Drawer>
    </>
  );
};

export default SideDrawer;