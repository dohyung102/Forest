import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './App.css';

import Toolbar from '@mui/material/Toolbar';

import Appbar from './components/layout/Appbar';
import Footer from './components/layout/Footer';
import Home from './components/pages/Home';
import Signup from './components/pages/Signup';
import Login from './components/pages/Login';
import Mypage from './components/pages/Mypage';
import Myposts from './components/pages/Myposts';
import Mycomments from './components/pages/MyComments';
import Myreviews from './components/pages/MyReviews';
import Search from './components/pages/Search';
import Community from './components/pages/Community';
import Post from './components/pages/Post';
import Write from './components/pages/Write';
import Detail from './components/pages/Detail';
import Product from './components/pages/Product';
import Store from './components/pages/Store';
import StoreMain from './components/pages/StoreMain';
import SellerAuth from './components/pages/SellerAuth';
import SellRegist from './components/pages/SellRegist';
import Survey from './components/pages/Survey';
import CartTest from './components/pages/CartTest';
import Carousel from './components/pages/Carousel';
import Seller from './components/pages/Seller';
import 'bootstrap/dist/css/bootstrap.min.css';


function App() {
  return (
    <Router>
      <Appbar />
      <Toolbar sx={{ height: '90px', mx: 1, my: 1 }} />
      <div className="layout">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/signup" element={<Signup />} />
          <Route path="/login" element={<Login />} />
          <Route path="/mypage" element={<Mypage />} />
          <Route path="/mypage/posts" element={<Myposts />} />
          <Route path="/mypage/comments" element={<Mycomments />} />
          <Route path="/mypage/reviews" element={<Myreviews />} />

          <Route path="/search" element={<Search />} />
          <Route path="/detail/:plant_id" element={<Detail />} />
          <Route path="/product/:product_id" element={<Product />} />
          <Route path="/community" element={<Community />} />
          <Route path="/community/:post_id" element={<Post />} />
          <Route path="/community/write" element={<Write />} />
          <Route path="/store" element={<StoreMain />} />
          <Route path="/store/:store_id" element={<Store />} />

          <Route path="/sellerauth" element={<SellerAuth />} />
          <Route path="/carttest" element={<CartTest />} />
          <Route path="/survey" element={<Survey />} />
          <Route path="/recommend" element={<Carousel />} />
          <Route path="/sell_regist" element={<SellRegist />} />
          <Route path="/seller" element={<Seller />} />
        </Routes>
      </div>
      <Footer />
    </Router>
  );
}

export default App;
