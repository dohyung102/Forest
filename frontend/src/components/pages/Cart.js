// import React, { useState, useCallback, FC, useEffect } from 'react';
// import { Button, Table, InputNumber, Tag } from 'antd';
// import { ProductModel, Quantity } from 'models';
// import { PriceLabel } from 'components/PriceLabel';
// import { CouponTag } from 'components/CouponTag';
// import { ConfirmModal } from 'components/ConfirmModal';

// type PropTypes = {
//   onClick: () => void;
//   dataSource: ProductModel[] | [];
//   onChange: (id: ProductModel['id'], quantity: number) => void;
//   onSelectChange: (selectedRowKeys: any, selectedRows: any) => void; // antd에서 any..
// };
// /**
//  * @description Cart페이지에서 장바구니 제품를 표시해 주는 테이블
//  */
// export const CartTable: FC<PropTypes> = props => {
//   const [selectedRowKeys, setSelectedRowKeys] = useState<string[]>([]);
//   const { onClick, onChange, dataSource, onSelectChange } = props;

//   // 장바구니 비우기 버튼 클릭 핸들러
//   const handleCleanCartClick = useCallback(() => {
//     ConfirmModal('장바구니에 있는 모든 상품을 삭제하시겠습니까?', onClick);
//   }, [onClick]);

//   const handleSelectChange = useCallback(
//     (selectedRowKeys: any, selectedRows) => {
//       setSelectedRowKeys(selectedRowKeys);
//       onSelectChange(selectedRowKeys, selectedRows);
//     },
//     [setSelectedRowKeys, selectedRowKeys, onSelectChange],
//   );

//   const rowSelection = {
//     selectedRowKeys,
//     onChange: handleSelectChange,
//   };

//   const handleInputNumberChange = useCallback(
//     (id: ProductModel['id'], quantity: number | undefined) => {
//       onChange(id, quantity as number);
//     },
//     [onChange],
//   );

//   const columns = [
//     {
//       title: '상품 제목',
//       dataIndex: 'title',
//       align: 'center' as 'center', // NOTE: 멍충한 antd 때문에 assertion을 통해 한번 더 타입을 확정해 준다
//       width: '50%',
//     },
//     {
//       title: '수량',
//       dataIndex: 'quantity',
//       align: 'center' as 'center',
//       value: InputNumber,
//       render: (quantity: Quantity) => (
//         <InputNumber
//           style={{ width: '65px' }}
//           min={1}
//           defaultValue={quantity.quantity}
//           onChange={num => handleInputNumberChange(quantity.id, num)}
//         />
//       ),
//     },
//     {
//       title: '가격',
//       dataIndex: 'displayPrice',
//       align: 'center' as 'center',
//       render: (displayPrice: number) => (
//         <PriceLabel value={displayPrice} strong={true} />
//       ),
//     },
//     {
//       title: '쿠폰 적용',
//       dataIndex: 'availableCoupon',
//       align: 'center' as 'center',
//       render: (availableCoupon: boolean) =>
//         availableCoupon === undefined ? (
//           <CouponTag
//             label="가능"
//             tooltip="아래 쿠폰 선택시 자동 적용됩니다"
//             color="#108ee9"
//           />
//         ) : (
//           <Tag>불가능</Tag>
//         ),
//     },
//   ];

//   return (
//     <>
//       <div style={{ marginBottom: 16, textAlign: 'right' }}>
//         <span style={{ marginRight: 10 }}>
//           {selectedRowKeys.length > 0
//             ? `선택 상품(${selectedRowKeys.length}개)`
//             : ' '}
//         </span>
//         <Button onClick={handleCleanCartClick} disabled={!dataSource.length}>
//           장바구니 비우기
//         </Button>
//       </div>
//       <Table
//         rowSelection={rowSelection}
//         columns={columns}
//         dataSource={dataSource}
//         pagination={false}
//       />
//     </>
//   );
// };

// export default Cart;

// import React from 'react';
// import { useTable } from 'react-table';

// // useTable에다가 작성한 columns와 data를 전달한 후 아래 4개의 props를 받아온다
// const Table = ({ columns, data }) => {
//   const { getTableProps, getTableBodyProps, headerGroups, rows, prepareRow } =
//     useTable({ columns, data });

//   return (
//     <TableSheet {...getTableProps()}>
//       <TableHead>
//         {headerGroups.map(header => (
//           // getHeaderGroupProps를 통해 header 배열을 호출한다
//           <Header {...header.getHeaderGroupProps()}>
//             {header.headers.map(col => (
//               // getHeaderProps는 각 셀 순서에 맞게 header를 호출한다
//               <Th {...col.getHeaderProps()}>{col.render('Header')}</Th>
//             ))}
//           </Header>
//         ))}
//       </TableHead>
//       <tbody {...getTableBodyProps()}>
//         {rows.map(row => {
//           prepareRow(row);
//           return (
//             // getRowProps는 각 row data를 호출해낸다
//             <tr {...row.getRowProps()}>
//               {row.cells.map(cell => (
//                 // getCellProps는 각 cell data를 호출해낸다
//                 <Td {...cell.getCellProps()}>{cell.render('Cell')}</Td>
//               ))}
//             </tr>
//           );
//         })}
//       </tbody>
//     </TableSheet>
//   );
// };

// export default Table;
import React from "react";
import { useCart } from "react-use-cart";

const Cart = () => {
  const {
    isEmpty,
    totalUniqueItems,
    items,
    totalItems,
    cartTotal,
    updateItemQuantity,
    removeItem,
    emptyCart
  } = useCart();
  const buy = () => {
    alert("완료");
  };
  if (isEmpty) return <h1 className="text-center"> Your cart isEmpty </h1>;
  return (
    <section className="container">
      <div className="row jistufy-content-center">
        <div className="col-12">
          <h5>
            {" "}
            Cart ({totalUniqueItems}) total Item :({totalItems})
          </h5>
          <table className="table table-light m-0">
            <tbody>
              {items.map((item, index) => {
                return (
                  <tr key={index}>
                    <td>
                      <img src={item.img} style={{ height: "6rem" }} />
                    </td>

                    <td>{item.title}</td>

                    <td>{item.price}</td>

                    <td>Quantity({item.quantity})</td>

                    <td>
                      <button
                        onClick={() =>
                          updateItemQuantity(item.id, item.quantity - 1)
                        }
                        className="btn btn-info ms-2"
                      >
                        {" "}
                        -{" "}
                      </button>
                      <button
                        onClick={() =>
                          updateItemQuantity(item.id, item.quantity + 1)
                        }
                        className="btn btn-info ms-2"
                      >
                        {" "}
                        +{" "}
                      </button>
                      <button
                        onClick={() => removeItem(item.id)}
                        className="btn btn-danger ms-2"
                      >
                        {" "}
                        RemoveItem{" "}
                      </button>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>

          <div className="col-auto ms-auto">
            <h2> total price: {cartTotal} EGP</h2>
          </div>
        </div>
        <div className="col-auto mb-2">
          <button onClick={() => emptyCart()} className="btn btn-danger ms-2">
            Clear Cart
          </button>
          <button onClick={buy} className="btn btn-primary ms-2">
            Buy Now{" "}
          </button>
        </div>
      </div>
    </section>
  );
};

export default Cart;
