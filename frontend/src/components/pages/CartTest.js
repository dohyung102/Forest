import ProductTest from "./ProductTest";
import Cart from "./Cart";
import { CartProvider } from "react-use-cart";
export default function App() {
  return (
    <div>
      <CartProvider>
        <ProductTest />
        <Cart />
      </CartProvider>
    </div>
  );
}