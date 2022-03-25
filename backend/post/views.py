from django.http import HttpResponse
from django.shortcuts import render
from rest_framework import viewsets, status


from .models import Post, Comment
from .serializers import PostSerializers, CommentSerializers
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly
from rest_framework.decorators import action
from rest_framework.response import Response
from .permissions import IsOwnerOrReadOnly
# Create your views here.

class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializers
    permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]

    def perform_create(self, serializer):
        serializer.save(user = self.request.user)



class CommentViewSet(viewsets.ModelViewSet):
    print(0)
    queryset = Comment.objects.all()
    serializer_class = CommentSerializers
    permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]
    print(1)
    # def list(self, request, post_pk):
    #     post = Post.objects.get(pk=post_pk)
    #     serializers = CommentSerializers()

    def perform_create(self, serializer):
        print(2)
        post = Post.objects.get(pk=self.kwargs['post_pk'])
        serializer.save(user = self.request.user, post=post)

    