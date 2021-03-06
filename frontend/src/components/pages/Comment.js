import React, { useState } from 'react';
import { useLocation, useNavigate, useParams } from 'react-router-dom';
import axios from 'axios'
import { Container, Typography, Avatar, Button } from '@mui/material';
import { Box } from '@mui/system';
import './Comment.css';

const Comment = (props) => {

  const params = useParams()
  const navigate = useNavigate()
  // const { state } = useLocation()
  const [comment, setComment] = useState('')
  // const [userData, setUserData] = useState([])
  const [commentPK, setCommentPK] = useState(0)
  const [commentEditContent, setCommentEditContent] = useState('')

  const commentHandle = (event) => {
    const commentInput = event.target.value
    setComment(commentInput)
  }

  const commentEditHandle = (event) => {
    const editInput = event.target.value
    setCommentEditContent(editInput)
  }

  const createComment = (e) => {
    e.preventDefault();
    axios({
      method: 'post',
      url: `http://j6d204.p.ssafy.io/api/posts/${params.post_id}/comment/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      },
      data: {
        content: comment
      }
    })
      .then((res) => {
        setComment('')
        const data = {
          ...props.comment,
          comment_set: [
            ...props.comment.comment_set,
            res.data
          ]
        }
        props.getPostData(data)
      })
      .catch((err) => {
        console.log(err)
      })
  }

  const editComment = (commentID) => {
    axios({
      method: 'put',
      url: `http://j6d204.p.ssafy.io/api/posts/${params.post_id}/comment/${commentID}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      },
      data: {
        content: commentEditContent
      }
    })
      .then((res) => {
        const data = {
          ...props.comment,
          comment_set: 
            props.comment.comment_set.map(comment => {
              if (comment.id === res.data.id) {
                return res.data
              } else {
                return comment
              }
            })
          };
        props.getPostData(data)
        setCommentPK(0)
      })
      .catch((err) => {
        console.log(err)
      })
  }

  const deleteComment = (commentID) => {
    axios({
      method: 'delete',
      url: `http://j6d204.p.ssafy.io/api/posts/${params.post_id}/comment/${commentID}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      },
    })
      .then((res) => {
        // navigate(`/community/${params.post_pk}`)
        console.log(res)
        const data = {
          ...props.comment,
          comment_set: 
            props.comment.comment_set.filter(comment => {
              return comment.id != commentID
            })
          };
          props.getPostData(data)
      })
      .catch((err) => {
        console.log(err)
      })
  }

  // const editCommentForm = (id) => {
  //   return (
  //     <form>
  //       <input 
  //         type='text'
  //         value={commentEditContent}
  //         name='comment_edit'
  //         onChange={commentEditHandle}
  //       />
  //       <button onClick={() => editComment(id)}>??????</button>
  //       <button onClick={() => setCommentPK(0)}>??????</button>
  //     </form>
  //   )
  // }

  const editFunc = (comment) => {
    setCommentPK(comment.id)
    setCommentEditContent(comment.content)
  }

  return (
    <div>
        <Box 
          sx={{
            marginY: 2,
          }}
          >
          <Typography fontWeight="fontWeightBold" variant="h6">
            ??????
          </Typography>
        </Box>
      <form>
        <textarea
          className='comment-textbox'
          type='text' 
          name='comment_input' 
          value={comment} 
          onChange={commentHandle} 
          placeholder='??? ?????? ?????? ??????'
        >
        </textarea>
        <Box className='button'>
          <Button onClick={createComment} variant="outlined" >?????? ??????</Button>
        </Box>
      </form>
      <hr/>
      <div>
        {props.comment.comment_set 
          &&
          props.comment.comment_set.map((comment) => {
          return(
            <div key={comment.id}>
              {commentPK === comment.id
                ?
                // editCommentForm(comment.id)
                <div>
                  <form>
                    <textarea
                      className='comment-textbox'
                      type='text'
                      value={commentEditContent}
                      name='comment_edit'
                      onChange={commentEditHandle}
                    >
                    </textarea>
                    <Box className='button'>
                      <Button onClick={() => editComment(comment.id)} variant="outlined" color='success'>??????</Button>
                      <Button onClick={() => setCommentPK(0)} variant="outlined" color='error'>??????</Button>
                    </Box>
                  </form>
                </div>
                :
                <div>
                  <Box
                    sx={{
                      display: 'flex',
                      flexDirection: 'row',
                      alignItems: 'center',
                      marginBottom: 3,
                    }}
                  >
                    <Box>
                      <Avatar
                        alt=""
                        src={comment.user.profile_image}
                        sx={{ width: '50px', height: '50px' }}
                      />
                    </Box>
                    <Box className="post-user-margin">
                      <Typography component="div" fontWeight="fontWeightBold">
                        {comment.user.email}
                      </Typography>
                      <Typography>{comment.content}</Typography>
                    </Box>
                  </Box>
                  {localStorage.getItem('user') === comment.user.email
                    && 
                    <div>
                      <Box className='button'>
                        <Button onClick={() => editFunc(comment)} variant="outlined" color='success'>??????</Button>
                        <Button onClick={() => deleteComment(comment.id)} variant="outlined" color='error'>??????</Button>
                      </Box>
                    </div>   
                  }         
                </div>
              }
              <hr/>
            </div>
          )
        })}
      </div>
    </div>
  );
};

export default Comment;