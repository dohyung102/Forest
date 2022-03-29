// import "./styles.css";
// import "bootstrap/dist/css/bootstrap.min.css";
import Product from "./Product";
import Cart from "./Cart";
import { CartProvider } from "react-use-cart";
export default function App() {
  return (
    <div>
      <CartProvider>
        <Product />
        <Cart />
      </CartProvider>
    </div>
  );
}
