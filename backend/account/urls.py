from django.urls import path

from . import views

urlpatterns = [
    path("signup/", views.signup),
    path("usertest/", views.UserApi.as_view())
]
