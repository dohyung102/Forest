from django.urls import path
from .views import GoogleLogin, GoogleConnect, PreferenceViewSet
# from accounts import views

# preference 등록
preference_list = PreferenceViewSet.as_view({
    'post': 'create'
})

# preference detail 보여주기, 삭제
preference_detail = PreferenceViewSet.as_view({
    'get': 'retrieve',
    'delete': 'destroy'
})

urlpatterns = [
    # path('google/', GoogleLogin.as_view(), name='google_login'),
    # path('google/connect/', GoogleConnect.as_view(), name='google_connect')

    # path('google/login/', views.google_login, name='google_login'),
    # path('google/login/callback/', views.google_callback, name='google_callback'),
    # path('google/login/finish/', views.GoogleLogin.as_view(), name='google_login_todjango'),
    path('preference/', preference_list),
    path('preference/<int:pk>/', preference_detail),
]