from urllib import response
from django.shortcuts import render
from matplotlib.pyplot import cla
from rest_framework import viewsets

from .models import Plant
from .serializers import PlantSerializers
from rest_framework.permissions import AllowAny
import logging

logger = logging.getLogger(__name__)


# Create your views here.

class PlantViewSet(viewsets.ModelViewSet):
    queryset = Plant.objects.all()
    serializer_class = PlantSerializers
    permission_classes = [AllowAny]

    def retrieve(self, request, pk, *args, **kwargs):
        if request.user.is_authenticated:
            logger.info(f'user_id = {request.user.id}, plant_id = {pk}')
        return super().retrieve(request, pk, *args, **kwargs)

class PlantSearchViewSet(viewsets.ModelViewSet):
    # search = request.GET.get()
    # queryset = Plant.objects.filter(name = search)
    pass


   
