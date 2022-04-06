from webbrowser import get
from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth import get_user_model
from rest_framework import viewsets, status


from .models import Post, Comment
from .serializers import PostSerializers, CommentSerializers, PostDetailSerializers
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly
from rest_framework.decorators import action
from rest_framework.response import Response
from .permissions import IsOwnerOrReadOnly
# Create your views here.

class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializers
    permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]

    def create(self, request, *args, **kwargs):
        print('posts created')
        return super().create(request, *args, **kwargs)
    # def perform_create(self, serializer):
    #     serializer.save(user = self.request.user)


class CommentViewSet(viewsets.ModelViewSet):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializers
    permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]
    # def list(self, request, post_pk):
    #     post = Post.objects.get(pk=post_pk)
    #     serializers = CommentSerializers()

    def perform_create(self, serializer):
        post = Post.objects.get(pk=self.kwargs['post_pk'])
        serializer.save(user = self.request.user, post=post)

class PostDetailViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostDetailSerializers
    permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]

# class MyPostViewSet(viewsets.ModelViewSet):
#     user = get_user_model()
#     writer = user.nickname
#     # print(writer)
#     queryset = Post.objects.filter(user=writer)
#     serializer_class = PostSerializers
#     permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]

#     def perform_create(self, serializer):
#         serializer.save(user = self.request.user)


# class MyCommentViewSet(viewsets.ModelViewSet):
#     print(0)
#     queryset = Comment.objects.all()
#     serializer_class = CommentSerializers
#     permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]
#     print(1)
#     # def list(self, request, post_pk):
#     #     post = Post.objects.get(pk=post_pk)
#     #     serializers = CommentSerializers()

#     def perform_create(self, serializer):
#         print(2)
#         post = Post.objects.get(pk=self.kwargs['post_pk'])
#         serializer.save(user = self.request.user, post=post)
    