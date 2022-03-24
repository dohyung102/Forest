from django.shortcuts import render
from rest_framework import viewsets

from .models import Post, Comment
from .serializers import PostSerializers, CommentSerializers
from rest_framework.permissions import AllowAny
# Create your views here.

class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializers
    permission_classes = [AllowAny]


class CommentViewSet(viewsets.ModelViewSet):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializers