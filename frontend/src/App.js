import './App.css';
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Appbar from './components/layout/Appbar'
import Layout from './components/layout/Layout';
import Login from './components/pages/login'

function App() {
  return (
    <div>
      <Layout />
    </div>
  );
}

export default App;
