from django.urls import path, include
from .views import PostViewSet, CommentViewSet
from rest_framework.routers import DefaultRouter

# post 목록, 등록
post_list = PostViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

# post detail 보여주기, 수정, 삭제
post_detail = PostViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'delete': 'destroy'
})

# Comment 목록, 등록
comment_list = CommentViewSet.as_view({
    # 'get': 'list',
    'post': 'create'
})

# Comment detail 보여주기, 수정, 삭제
comment_detail = CommentViewSet.as_view({
    # 'get': 'retrieve',
    'put': 'update',
    'delete': 'destroy'
})


urlpatterns = [
    path('', post_list),
    path('<int:pk>/', post_detail),
    path('<int:post_pk>/comment/', comment_list),
    path('<int:post_pk>/comment/<int:pk>/', comment_detail)
]
# app_name = 'posts'
# router = DefaultRouter()
# router.register("", PostViewSet, basename="post")
# router.register("<int:post_pk>/comment/", CommentViewSet, basename="comment")

# urlpatterns = [
#   path('', include(router.urls))
# ]