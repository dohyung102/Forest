from django.urls import path
from .views import PlantViewSet, PlantSearchViewSet, PlantListViewSet

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


plant_search = PlantSearchViewSet.as_view({
    'get': 'list'
})

urlpatterns = [
    path('', plant_list),
    path('<int:pk>/', plant_detail),
    path('search/', plant_search)
]
