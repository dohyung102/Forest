from django.urls import path
from .views import ProductViewSet

# Store 목록, 등록
product_list = ProductViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

# Store detail 보여주기, 수정, 삭제
product_detail = ProductViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'delete': 'destroy'
})

urlpatterns = [
    path('', product_list),
    path('<int:pk>', product_detail)
]
