import React, { useState, useCallback, useEffect } from "react";
// import { useCart } from "react-use-cart";
import { Divider } from "@mui/material";

import axios from 'axios'

const Cart = () => {

  const [wishList, setWishList] = useState()
  // const [numItems, setNumItems] = useState(0)
  const [render, setRender] = useState(0)

  const getWishList = useCallback(async () => {
    const headers = {
      Authorization: `Bearer ${localStorage.getItem('token')}`,
    };
    await axios
      .get('http://j6d204.p.ssafy.io/api/accounts/user/', {
        headers: headers,
      })
      .then((res) => {
        console.log(res.data.wishlist_set);
        setWishList(res.data.wishlist_set);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);

  // const getTotalItems = () => {
  //   setNumItems(0)
  //   if (wishList) {
  //     wishList.map(item => {
  //       console.log(item.product.num)
  //       setNumItems(numItems => numItems + item.product.num)
  //     })
  //   }
  // }

  useEffect(() => {
    getWishList()
  }, [getWishList, render])

  // useEffect(() => {
  //   getTotalItems()
  // }, [wishList])

  const changeImage = (e) => {
    e.target.src = 'http://j6d204.p.ssafy.io/backend/media/images/no_image.jpg'
  }

  const removeWishItem = (item) => {
    // e.preventDefault()
    setRender(1)
    axios({
      method: 'delete',
      url: `http://j6d204.p.ssafy.io/api/products/${item.product.id}/wishlist/${item.id}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
    })
      .then((res) => {
        console.log(res)
        setRender(0)
      })
      .catch((err) => {
        console.log(err)
      })
  }

  // const {
  //   isEmpty,
  //   totalUniqueItems,
  //   items,
  //   totalItems,
  //   cartTotal,
  //   updateItemQuantity,
  //   removeItem,
  //   emptyCart
  // } = useCart();
  // const buy = () => {
  //   alert("완료");
  // };
  // if (!wishList) return <h1 className="text-center"> Your cart isEmpty </h1>;
  return (
    <section className="container">
      <div className='store-main-title'>장바구니</div>
      <Divider sx={{my: 4}} light variant="middle" />

      <div className="row jistufy-content-center">
        <div className="col-12">
          <div>
            장바구니 상품 ({wishList && wishList.length}) 
            {/* total Item :({numItems}) */}
          </div>
          <table className="table table-light m-0">
            <tbody>
              {wishList && wishList.map((item, index) => {
                return (
                  <tr key={index}>
                    <div
                      style={{ display:'flex', alignItems: 'center', justifyContent: 'space-evenly'}}
                    >
                      <td>
                        <img src={item.product.profile_image} onError={changeImage}
                          alt="product-img" style={{ height: "6rem" }} />
                      </td>
                      <td>{item.product.name}</td>
                      <td>수량 : 1</td>
                      <td>{item.product.price}원</td>
                      <td>
                        {/* <button
                          onClick={() =>
                            updateItemQuantity(item.id, item.product.num - 1)
                          }
                          className="btn btn-info ms-2"
                        >
                          -
                        </button>
                        <button
                          onClick={() =>
                            updateItemQuantity(item.id, item.product.num + 1)
                          }
                          className="btn btn-info ms-2"
                        >
                          +
                        </button> */}
                        <button
                          onClick={() => removeWishItem(item)}
                          className="btn btn-danger ms-2"
                        >
                          삭제
                        </button>
                      </td>
                    </div>
                  </tr>
                );
              })}
            </tbody>
          </table>

          {/* <div className="col-auto ms-auto">
            <h2> total price: {cartTotal} EGP</h2>
          </div> */}
        </div>
      </div>
      <div className="mb-2"
        >
        {/* <button onClick={() => emptyCart()} className="btn btn-danger ms-2">
          모두 삭제
        </button> */}
        <button className="btn btn-primary ms-2 my-2"
          style={{ float: 'right' }}
        >
          구매하기
        </button>
      </div>
    </section>
  );
};

export default Cart;
