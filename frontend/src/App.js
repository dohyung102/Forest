import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import './App.css';

import Appbar from './components/layout/Appbar';
import Home from './components/pages/Home'
import Signup from './components/pages/Signup'
import Login from './components/pages/Login'
import Mypage from './components/pages/Mypage'
import Myposts from './components/pages/Myposts'
import Mycomments from './components/pages/MyComments'
import Search from './components/pages/Search'
import Community from './components/pages/Community'
import Post from './components/pages/Post'
import Write from './components/pages/Write'
import Detail from './components/pages/Detail'
import Product from './components/pages/Product'
import Store from './components/pages/Store'
import SellerAuth from "./components/pages/SellerAuth";

function App() {
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
          <Route path="/mypage/comments" element={<Mycomments />} />
          <Route path="/search" element={<Search />} />
          <Route path="/detail/:plant_id" element={<Detail />} />
          <Route path="/product/:plant" element={<Product />} />
          <Route path="/community" element={<Community />} />
          <Route path="/community/:post_pk" element={<Post />} />
          <Route path="/community/write" element={<Write />} />
          <Route path="/store" element={<Store />} />
          <Route path="/sellerauth" element={<SellerAuth />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
