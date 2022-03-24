import React from 'react';
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

import Appbar from './Appbar';

import Home from '../pages/Home'
import Signup from '../pages/Signup'
import Login from '../pages/Login'
import Mypage from '../pages/Mypage'
import Myposts from '../pages/Myposts'
import Myreviews from '../pages/Myreviews'
import Search from '../pages/Search'
import Community from '../pages/Community'
import Post from '../pages/Post'
import Detail from '../pages/Detail'
import Product from '../pages/Product'
import Store from '../pages/Store'

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
          <Route path="/mypage/posts" element={<Myposts />} />
          <Route path="/mypage/reviews" element={<Myreviews />} />
          <Route path="/search" element={<Search />} />
          <Route path="/detail/:plant" element={<Detail />} />
          <Route path="/product/:plant" element={<Product />} />
          <Route path="/community" element={<Community />} />
          <Route path="/post" element={<Post />} />
          <Route path="/store" element={<Store />} />
        </Routes>
      </div>
    </Router>
  );
};

export default Layout;