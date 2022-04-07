from turtle import fd
from urllib import response
from django.shortcuts import render
from rest_framework.response import Response
from matplotlib.pyplot import cla
from rest_framework import viewsets, status

from .models import Plant
from .serializers import PlantSerializers, PlantListSerializers, PlantNameSerializers
from rest_framework.permissions import AllowAny
import logging
from .recomm_functions import plants_data_vectorization
from plant import serializers
import plant.recomm_functions as rf

logger = logging.getLogger(__name__)


# Create your views here.

class PlantListViewSet(viewsets.ModelViewSet):
    queryset = Plant.objects.all()
    serializer_class = PlantListSerializers
    permission_classes = [AllowAny]

    def list(self, request):
        plants = Plant.objects.all()
        serialzers = PlantListSerializers(plants, many=True)
        return Response(serialzers.data, status=status.HTTP_200_OK)

    def create(self, request, *args, **kwargs):
        serializer = PlantSerializers(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            plants_data_vectorization()
            return Response(serializer.data, status=status.HTTP_200_OK)


class PlantViewSet(viewsets.ModelViewSet):
    queryset = Plant.objects.all()
    serializer_class = PlantSerializers
    permission_classes = [AllowAny]

    # def list(self, request):
    #     plants = Plant.objects.all()

    #     serialzers = PlantListSerializers(plants, many=True)
    #     return Response(serialzers.data, status=status.HTTP_200_OK)

    def retrieve(self, request, pk, *args, **kwargs):
        if request.user.is_authenticated:
            logger.info(f'user_id = {request.user.id}, plant_id = {pk}')
        return super().retrieve(request, pk, *args, **kwargs)

    def recomm(self, request):
        if request.user.is_authenticated:
            plants = rf.find_user_data_based_plants_by_user_id(request.user.id)
            #추천 기반 리턴
            return Response(plants, status=status.HTTP_200_OK)
        plants = Plant.objects.order_by('-pk')[:10]
        serialzers = PlantSerializers(plants, many=True)
        return Response(serialzers.data, status=status.HTTP_200_OK)

class PlantRecommViewSet(viewsets.ModelViewSet):
    queryset = Plant.objects.all()
    serializer_class = PlantListSerializers
    permission_classes = [AllowAny]

    def recomm(self, request):
        # if request.user.is_authenticated:
        #     plants = rf.find_user_data_based_plants_by_user_id(request.user.id)
        #     #추천 기반 리턴
        #     return Response(plants, status=status.HTTP_200_OK)
        plants = Plant.objects.order_by('?')[:10]
        serialzers = PlantListSerializers(plants, many=True)
        return Response(serialzers.data, status=status.HTTP_200_OK)

class PlantNameViewSet(viewsets.ModelViewSet):
    queryset = Plant.objects.all()
    serializer_class = PlantNameSerializers
    permission_classes = [AllowAny]

    def names(self, request):
        plants = Plant.objects.all()
        serialzers = PlantNameSerializers(plants, many=True)
        return Response(serialzers.data, status=status.HTTP_200_OK)


   
