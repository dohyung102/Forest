from django.shortcuts import render
from matplotlib.pyplot import cla
from rest_framework import viewsets

from .models import Plant
from .serializers import PlantSerializers

# Create your views here.

class PlantViewSet(viewsets.ModelViewSet):
    queryset = Plant.objects.all()
    serializer_class = PlantSerializers