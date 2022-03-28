from django.urls import path
from .views import GoogleLogin, GoogleConnect
# from accounts import views

urlpatterns = [
    # path('google/', GoogleLogin.as_view(), name='google_login'),
    # path('google/connect/', GoogleConnect.as_view(), name='google_connect')

    # path('google/login/', views.google_login, name='google_login'),
    # path('google/login/callback/', views.google_callback, name='google_callback'),
    # path('google/login/finish/', views.GoogleLogin.as_view(), name='google_login_todjango'),

]