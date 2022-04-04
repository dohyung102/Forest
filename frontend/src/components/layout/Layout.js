import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Toolbar from '@mui/material/Toolbar';

import Appbar from './Appbar';
import Footer from './Footer';

import React from 'react';
import CartTest from '../pages/CartTest';
import Carousel from '../pages/Carousel';
import Survey from '../pages/Survey';
import SellRegist from '../pages/SellRegist';
import Home from '../pages/Home';
import Signup from '../pages/Signup';
import Login from '../pages/Login';
import Mypage from '../pages/Mypage';
import Myposts from '../pages/Myposts';
import Myreviews from '../pages/Myreviews';
import Search from '../pages/Search';
import Community from '../pages/Community';
import Post from '../pages/Post';
import Write from '../pages/Write';
import Detail from '../pages/Detail';
import Product from '../pages/Product';
import Store from '../pages/Store';

const Layout = () => {
  return (
    <Router>
      <Appbar />
      <Toolbar sx={{ mx: 1, my: 1 }} />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/carttest" element={<CartTest />} />
        <Route path="/sell_regist" element={<SellRegist />} />
        <Route path="/survey" element={<Survey />} />
        <Route path="/recommend" element={<Carousel />} />
        <Route path="/signup" element={<Signup />} />
        <Route path="/login" element={<Login />} />
        <Route path="/mypage" element={<Mypage />} />
        <Route path="/mypage/posts" element={<Myposts />} />
        <Route path="/mypage/reviews" element={<Myreviews />} />
        <Route path="/search" element={<Search />} />
        <Route path="/detail/:plant" element={<Detail />} />
        <Route path="/product/:plant" element={<Product />} />
        <Route path="/community" element={<Community />} />
        <Route path="/community/:post_pk" element={<Post />} />
        <Route path="/community/write" element={<Write />} />
        <Route path="/store" element={<Store />} />
      </Routes>
    </Router>
  );
};

export default Layout;
