from django.shortcuts import render
from matplotlib.pyplot import cla
from rest_framework import viewsets

from .models import Store
from .serializers import StoreSerializers

# Create your views here.

class StoreViewSet(viewsets.ModelViewSet):
    queryset = Store.objects.all()
    serializer_class = StoreSerializers
