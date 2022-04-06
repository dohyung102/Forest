from django.urls import path
from .views import PlantViewSet, PlantListViewSet, PlantRecommViewSet, PlantNameViewSet

# Store 목록, 등록
plant_list = PlantListViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

# Store detail 보여주기, 수정, 삭제
plant_detail = PlantViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'delete': 'destroy'
})


plant_user_custom = PlantRecommViewSet.as_view({
    'get': 'recomm'
})

plant_name = PlantNameViewSet.as_view({
    'get': 'names'
})

urlpatterns = [
    path('', plant_list),
    path('<int:pk>/', plant_detail),
    path('usercustom/', plant_user_custom),
    path('name/', plant_name),
]
