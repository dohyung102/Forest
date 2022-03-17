import React from 'react';
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

import Appbar from './Appbar';

import Home from '../pages/Home'
import Signup from '../pages/Signup'
import Login from '../pages/Login'
import Mypage from '../pages/Mypage'
import Community from '../pages/Community'

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