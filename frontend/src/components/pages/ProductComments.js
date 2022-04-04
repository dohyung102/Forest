import React, { useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import axios from 'axios'

const ProductComments = (props) => {

  // 에러 잡는 중
  
  // console.log(props)
  // const params = useParams()
  // const navigate = useNavigate()
  // const [comment, setComment] = useState('')
  // const [commentPK, setCommentPK] = useState(0)
  // const [commentEditContent, setCommentEditContent] = useState('')

  // const commentHandle = (event) => {
  //   const commentInput = event.target.value
  //   setComment(commentInput)
  // }

  // const commentEditHandle = (event) => {
  //   const editInput = event.target.value
  //   setCommentEditContent(editInput)
  // }

  // const createComment = (e) => {
  //   e.preventDefault();
  //   axios({
  //     method: 'post',
  //     url: `http://localhost:8000/api/posts/${params.post_pk}/comment/`,
  //     headers: {
  //       Authorization: `Bearer ${localStorage.getItem('token')}`
  //     },
  //     data: {
  //       content: comment
  //     }
  //   })
  //     .then((res) => {
  //       console.log(res)
  //     })
  //     .catch((err) => {
  //       console.log(err)
  //     })
  // }

  // const editComment = (commentID) => {
  //   axios({
  //     method: 'put',
  //     url: `http://localhost:8000/api/posts/${params.post_pk}/comment/${commentID}/`,
  //     headers: {
  //       Authorization: `Bearer ${localStorage.getItem('token')}`
  //     },
  //     data: {
  //       content: commentEditContent
  //     }
  //   })
  //     .then((res) => {
  //       console.log(res.data)
  //     })
  //     .catch((err) => {
  //       console.log(err)
  //     })
  // }

  // const deleteComment = (commentID) => {
  //   axios({
  //     method: 'delete',
  //     url: `http://localhost:8000/api/posts/${params.post_pk}/comment/${commentID}/`,
  //     headers: {
  //       Authorization: `Bearer ${localStorage.getItem('token')}`
  //     },
  //   })
  //     .then((res) => {
  //       // navigate(`/community/${params.post_pk}`)
  //       console.log('delete complete')
  //     })
  //     .catch((err) => {
  //       console.log(err)
  //     })
  // }

  // const editFunc = (comment) => {
  //   setCommentPK(comment.id)
  //   setCommentEditContent(comment.content)
  // }

  return (
    // 에러 잡는 중
    <div></div>
    // <div>
    //   댓글목록
    //   <form>
    //     <input 
    //       type='text' 
    //       name='comment_input' 
    //       value={comment} 
    //       onChange={commentHandle} 
    //       placeholder='이 곳에 댓글 작성' 
    //     />
    //     <button onClick={createComment}>댓글 쓰기</button>
    //   </form>
    //   <div>
    //     {props.comment.comment_set 
    //       &&
    //       props.comment.comment_set.map((comment) => {
    //       return(
    //         <div key={comment.id}>
    //           {commentPK === comment.id
    //             ?
    //             <div>
    //               <form>
    //                 <input 
    //                   type='text'
    //                   value={commentEditContent}
    //                   name='comment_edit'
    //                   // onChange={commentEditHandle}
    //                 />
    //                 {/* <button onClick={() => editComment(comment.id)}>수정</button> */}
    //                 <button>수정</button>
    //                 {/* <button onClick={() => setCommentPK(0)}>취소</button> */}
    //                 <button>취소</button>
    //               </form>
    //             </div>
    //             :
    //             <div>
    //               {comment.user} | {comment.content} | {comment.create_date}
    //               {localStorage.getItem('user') === comment.user
    //                 && 
    //                 <div>
    //                   {/* <button onClick={() => setCommentPK(comment.id)}>수정</button> */}
    //                   {/* <button onClick={() => editFunc(comment)}>수정</button> */}
    //                   {/* <button onClick={() => deleteComment(comment.id)}>삭제</button> */}
    //                 </div>                
    //               }
    //             </div>
    //           }
    //         </div>
    //       )
    //     })}
    //   </div>
    // </div>
  );
};

export default ProductComments;