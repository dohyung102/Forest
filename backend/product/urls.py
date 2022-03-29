from django.urls import path
from .views import ProductViewSet, WishlistViewSet, ReviewViewSet, BuyViewSet

# Product 목록, 등록
product_list = ProductViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

# Product detail 보여주기, 수정, 삭제
product_detail = ProductViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    # 'delete': 'destroy'
})

# buy 목록, 등록
product_buy_list = BuyViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

# wishlist 목록, 등록
wishlist = WishlistViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

# wishlist detail 수정, 삭제
wishlist_detail = WishlistViewSet.as_view({
    # 'get': 'retrieve',
    'put': 'update',
    'delete': 'destroy'
})

# review 목록, 등록
product_review_list = ReviewViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

# review detail 수정, 삭제
product_review_detail = ReviewViewSet.as_view({
    # 'get': 'retrieve',
    'put': 'update',
    'delete': 'destroy'
})

urlpatterns = [
    path('', product_list),
    path('<int:pk>/', product_detail),
    path('<int:product_pk>/buy/', product_buy_list), #구매 상품 등록 및 조회
    path('<int:product_pk>/wishlist/', wishlist), # 장바구니 등록 및 조회
    path('<int:product_pk>/wishlist/<int:pk>/', wishlist_detail), # 장바구니 수정 및 삭제
    path('<int:product_pk>/review/', product_review_list), # 상품 리뷰 등록 및 조회
    path('<int:product_pk>/review/<int:pk>/', product_review_detail) # 상품 리뷰 수정 및 삭제

]
