import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import axios from 'axios'

const ProductReviews = (props) => {

  console.log(props)
  const [reviewData, setReviewData] = useState()
  const params = useParams()
  const navigate = useNavigate()
  // const [title, setTitle] = useState('')
  const [loading, setLoading] = useState(false)
  const [review, setReview] = useState('')
  const [star, setStar] = useState(5)
  const [reviewPK, setReviewPK] = useState(0)
  const [reviewEditContent, setReviewEditContent] = useState('')
  const [reviewEditStar, setReviewEditStar] = useState('')

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
        console.log(res)
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
        console.log(res.data)
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
        // navigate(`/community/${params.post_pk}`)
        console.log('delete complete')
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
      리뷰 목록
      <form>
        <div>
          <label htmlFor="review_input">리뷰 </label>
          <input 
            type='text' 
            name='review_input' 
            value={review} 
            onChange={reviewHandle} 
            placeholder='이 곳에 리뷰 작성' 
          />
        </div>
        <div>
          <label htmlFor="star_input">평점 </label>
          <input 
            type='number' 
            name='star_input' 
            value={star} 
            onChange={starHandle} 
            min='0'
            max='5'
            placeholder='이 곳에 평점 작성' 
          />
        </div>
        <button onClick={createReview}>리뷰 작성</button>
      </form>
      <div>
        {props.reviews
          &&
          props.reviews.map((review) => {
          return(
            <div key={review.id}>
              {reviewPK === review.id
                ?
                <div>
                  <form>
                    <div>
                      <label htmlFor="review_edit">리뷰 </label>
                      <input 
                        type='text'
                        value={reviewEditContent}
                        name='review_edit'
                        onChange={reviewEditHandle}
                      />
                    </div>
                    <div>
                      <label htmlFor="star_edit">평점 </label>
                      <input 
                        type='number'
                        value={reviewEditStar}
                        name='star_edit'
                        onChange={starEditHandle}
                        min='0'
                        max='5'
                      />
                    </div>
                    <button onClick={() => editReview(review.id)}>수정</button>
                    <button onClick={() => setReviewPK(0)}>취소</button>
                  </form>
                </div>
                :
                <div>
                  {review.user} | {review.context} | {review.create_date} | {review.star}
                  {localStorage.getItem('user') === review.user
                    && 
                    <div>
                      <button onClick={() => setReviewPK(review.id)}>수정</button>
                      <button onClick={() => editFunc(review)}>수정</button>
                      <button onClick={() => deleteReview(review.id)}>삭제</button>
                    </div>                
                  }
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