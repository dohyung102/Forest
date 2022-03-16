import React from 'react';
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

import Appbar from './Appbar';

import Home from '../pages/home'
import Signup from '../pages/signup'
import Login from '../pages/login'
import Mypage from '../pages/mypage'
import Community from '../pages/community'

const Layout = () => {
  return (
    <Router>
      <Appbar />
      <div className='layout'>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/signup" element={<Signup />} />
          <Route path="/login" element={<Login />} />
          <Route path="/mypage" element={<Mypage />} />
          <Route path="/community" element={<Community />} />
        </Routes>
      </div>
    </Router>
  );
};

export default Layout;