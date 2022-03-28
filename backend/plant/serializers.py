from dataclasses import field
from rest_framework import serializers
from .models import Plant

class PlantSerializers(serializers.ModelSerializer):
    class Meta:
        model = Plant
        fields = '__all__'
