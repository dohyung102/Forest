import React, { useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import axios from 'axios'
import { Grid, Rating } from '@mui/material';


import './Product.css'

const ProductReviews = (props) => {

  console.log(props)
  // const [reviewData, setReviewData] = useState()
  const params = useParams()
  const navigate = useNavigate()
  // const [title, setTitle] = useState('')
  const [loading, setLoading] = useState(false)
  const [review, setReview] = useState('')
  const [star, setStar] = useState(5)
  const [reviewPK, setReviewPK] = useState(0)
  const [reviewEditContent, setReviewEditContent] = useState('')
  const [reviewEditStar, setReviewEditStar] = useState(0)

  // const titleHandle = (event) => {
  //   const titleInput = event.target.value
  //   setTitle(titleInput)
  // }

  const reviewHandle = (event) => {
    const reviewInput = event.target.value
    setReview(reviewInput)
  }

  const starHandle = (event) => {
    const starInput = event.target.value
    setStar(starInput)
  }

  const reviewEditHandle = (event) => {
    const editInput = event.target.value
    setReviewEditContent(editInput)
  }

  const starEditHandle = (event) => {
    const editInput = event.target.value
    console.log(editInput)
    setReviewEditStar(editInput)
  }

  const createReview = (event) => {
    event.preventDefault()
    console.log(props.loading)
    props.setLoading(true)
    console.log(props.loading)
    axios({
      method: 'post',
      url: `http://j6d204.p.ssafy.io/api/products/${params.product_id}/review/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      },
      data: {
        context: review,
        star: star,
      }
    })
      .then((res) => {
        setReview('')
        const data = [
          ...props.reviews,
          res.data
        ];
        props.getReviews(data)
      })
      .catch((err) => {
        console.log(err)
      })
      
    props.setLoading(false)
    console.log(props.loading)
  }

  const editReview = (reviewID) => {
    axios({
      method: 'put',
      url: `http://j6d204.p.ssafy.io/api/products/${params.product_id}/review/${reviewID}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      },
      data: {
        context: reviewEditContent,
        star: reviewEditStar
      }
    })
      .then((res) => {
        const data = 
            props.reviews.map(review => {
              if (review.id === res.data.id) {
                return res.data
              } else {
                return review
              }
            })
        props.getReviews(data)
        setReviewPK(0)
      })
      .catch((err) => {
        console.log(err)
      })
  }

  const deleteReview = (reviewID) => {
    axios({
      method: 'delete',
      url: `http://j6d204.p.ssafy.io/api/products/${params.product_id}/review/${reviewID}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      },
    })
      .then((res) => {
        const data = 
            props.reviews.filter(review => {
              return review.id != reviewID
            })
          
        console.log(props.reviews)
        console.log(data)
        props.getReviews(data)
      })
      .catch((err) => {
        console.log(err)
      })
  }

  const editFunc = (review) => {
    setReviewPK(review.id)
    setReviewEditContent(review.context)
    setReviewEditStar(review.star)
  }

  // const getReviews = useCallback(async () => {
  //   const headers = {
  //     'Authorization' : `Bearer ${localStorage.getItem('token')}`
  //   }
  //   await axios.get(`http://j6d204.p.ssafy.io/api/products/${params.product_id}/`,
  //     {headers : headers}
  //   )
  //   .then((res) => {
  //     console.log(res.data.review_set)
  //     setReviewData(res.data.review_set)
  //   })
  //   .catch((err) => {
  //     console.log(err)
  //   })
  // }, [params])

  // useEffect(() => {
  //   getReviews()
  // }, [getReviews])

  return (
    <div>
      <div className='product-sub-title'>
        리뷰
      </div>
      <form className='product-form'>
        <Grid container>
          {/* <label htmlFor="review_input">내용 </label> */}
          <Grid item xs={12} md={9}>
            <textarea 
              className="product-input-area"
              type='text' 
              name='review_input' 
              value={review} 
              onChange={reviewHandle} 
              placeholder='이 곳에 리뷰 작성' 
            />
          </Grid>
          <Grid item md={3}>
            <Grid container
              direction='column' justifyContent='center' alignItems='center'
            >
              <Rating
                size="large"
                name="simple-controlled"
                value={star}
                onChange={(event, star) => {
                  setStar(star);
                }}
              />
              <button
                className='product-btn'
                onClick={createReview}>
                  리뷰 작성
              </button>
            </Grid>
          </Grid>
        </Grid>
      </form>
      <div className='review-list'>
        {props.reviews
          &&
          props.reviews.map((review) => {
          return(
            <div key={review.id}>
              {reviewPK === review.id
                ?
                  <form className='product-form'>
                    <div className='review-user'>{review.user}</div>
                    <Grid container>
                      <Grid item xs={12} md={9}>
                        {/* <label htmlFor="review_edit">리뷰 </label> */}
                        <textarea 
                          className='product-input-area'
                          type='text'
                          value={reviewEditContent}
                          name='review_edit'
                          onChange={reviewEditHandle}
                        />
                      </Grid>
                      <Grid item xs={12} md={3}>
                        <Grid container
                          direction='column' justifyContent='center' alignItems='center'
                        >
                          <Rating
                            size="large"
                            name="star_edit"
                            value={reviewEditStar}
                            onChange={(reviewEditStar) => {starEditHandle(reviewEditStar)}}
                            // onChange={(event, reviewEditStar) => {
                            //   starEditHandle(reviewEditStar);
                            // }}
                          />
                          <div>
                            <button className='product-edit-button' onClick={() => editReview(review.id)}>수정</button>
                            <button className='product-edit-button' onClick={() => setReviewPK(0)}>취소</button>
                          </div>
                        </Grid>
                      </Grid>
                    </Grid>
                  </form>
                :
                <div className='product-review'>
                  <div className='review-user'>{review.user}</div>
                  <div className='product-review-div'>
                    <Rating value={review.star} readOnly />
                    <div className='review-date'>{review.created_date}</div>
                  </div>
                  {localStorage.getItem('user') === review.user
                    && 
                    <div className='product-btn-list'>
                      {/* <button onClick={() => setReviewPK(review.id)}>수정</button> */}
                      <button className='product-btn-edit' onClick={() => editFunc(review)}>수정</button>
                      <button className='product-btn-edit' onClick={() => deleteReview(review.id)}>삭제</button>
                    </div>                
                  }
                  <div className='review-context'>{review.context}</div>
                </div>
              }
            </div>
          )
        })}
      </div>
    </div>
  );
};

export default ProductReviews;