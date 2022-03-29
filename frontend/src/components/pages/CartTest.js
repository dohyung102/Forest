import ProductTest from "./ProductTest";
import CartTest from "./CartTest";
import { CartProvider } from "react-use-cart";
export default function App() {
  return (
    <div>
      <CartProvider>
        <ProductTest />
        <CartTest />
      </CartProvider>
    </div>
  );
}