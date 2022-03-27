from django.shortcuts import render
from matplotlib.pyplot import cla
from rest_framework import viewsets, status

from .models import Store
from .serializers import StoreSerializers
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from .permissions import IsOwnerOrReadOnly
from rest_framework.response import Response
from .serializers import StoreSerializers
# Create your views here.

class StoreViewSet(viewsets.ModelViewSet):
    queryset = Store.objects.all()
    serializer_class = StoreSerializers
    permission_classes = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]
    # permission_classes_by_action = {'create': IsUserHasRole}

    def create(self, request):
        if request.user.role:
            serializer = StoreSerializers(data=request.data)
            if serializer.is_valid(raise_exception=True):
                serializer.save(user = self.request.user)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response('권한이 없습니다.', status=status.HTTP_400_BAD_REQUEST)


    