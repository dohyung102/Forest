from django.urls import path
from .views import PostViewSet

# Store 목록, 등록
post_list = PostViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

# Store detail 보여주기, 수정, 삭제
post_detail = PostViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'delete': 'destroy'
})

urlpatterns = [
    path('', post_list),
    path('<int:pk>/', post_detail)
]
