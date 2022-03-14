from django.shortcuts import render
from rest_framework.response import Response
from .serializers import UserSerializer
from .models import User

# Create your views here.
def signup(request):
    return Response("1")
