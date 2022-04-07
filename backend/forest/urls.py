"""forest URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django import urls
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, re_path, include
from rest_framework import routers
from dj_rest_auth.registration.views import (RegisterView, VerifyEmailView, ConfirmEmailView)
from dj_rest_auth.views import (LoginView, LogoutView, UserDetailsView)

router = routers.DefaultRouter()

urlpatterns = [
    ### admin
    path('admin/', admin.site.urls),

    path('api/', include(router.urls)),
    path('api/api-auth', include('rest_framework.urls', namespace='rest_framework')),

    ### social login
    path('api/users/login/', LoginView.as_view()),
    path('api/users/logout/', LogoutView.as_view()),
    path('api/users/signup/', RegisterView.as_view(), name='rest_signup'),

    path('api/accounts/', include('dj_rest_auth.urls')),
    # path('accounts/registration/', include('dj_rest_auth.registration.urls')),
    path('api/accounts/', include('allauth.urls')),
    path('api/accounts/', include('accounts.urls')), 

    # # 유효한 이메일이 유저에게 전달
    # re_path(r'^account-confirm-email/$', VerifyEmailView.as_view(), name='account_email_verification_sent'),
    # # 유저가 클릭한 이메일(=링크) 확인
    # re_path(r'^account-confirm-email/(?P<key>[-:\w]+)/$', ConfirmEmailView.as_view(), name='account_confirm_email'),

    ### my apps
    path('api/plants/', include('plant.urls')),
    path('api/products/', include('product.urls')),
    path('api/stores/', include('store.urls')),
    path('api/posts/', include('post.urls'))
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
