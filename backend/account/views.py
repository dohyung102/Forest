from uuid import RESERVED_FUTURE
from django.shortcuts import render
""" rest api framework """
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
""" models """
from .serializers import UserSerializer
from .models import User

# Create your views here.

"""
    함수 기반 rest api template
"""

@api_view(['GET'])
def signup(request):
    return Response(status.HTTP_200_OK)

"""
    클래스 기반 rest api template 
    추후 CRUD 외 작성하는 것에 대해서 연구 필요
"""

class UserApi(APIView):
    def post(self, request, format=None):
        return Response(status.HTTP_201_CREATED)

    def get(self, reqeust, format=None):
        return Response(status.HTTP_200_OK)

    def put(self, request, format=None):
        return Response(status.HTTP_200_OK)

    def delete(self, request, format=None):
        return Response(status.HTTP_204_NO_CONTENT)
