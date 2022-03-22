from django.urls import path
from .views import StoreViewSet

# Store 목록, 등록
store_list = StoreViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

# Store detail 보여주기, 수정, 삭제
store_detail = StoreViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'delete': 'destroy'
})

urlpatterns = [
    path('', store_list),
    path('<int:pk>', store_detail)
]
