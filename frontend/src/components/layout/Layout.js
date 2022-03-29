import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import React from 'react';
import Appbar from './Appbar';
import Cart from '../pages/Cart'
import Carousel from '../pages/Carousel'
import Survey from '../pages/Survey'
import SellRegist from '../pages/SellRegist'
import Home from '../pages/Home'

const Layout = () => {
  return (
    <Router>
      <Appbar />
      <div className='layout'>
        <Routes>
          <Route path="/home" element={<Home />} />
          <Route path="/cart" element={<Cart />} />
          <Route path="/sell_regist" element={<SellRegist />} />
          <Route path="/survey" element={<Survey />} />
          <Route path="/recommend" element={<Carousel />} />
        </Routes>
      </div>
    </Router>
  );
};

export default Layout;