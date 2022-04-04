from dataclasses import field
from rest_framework import serializers
from .models import Plant
from .recomm_functions import find_similar_plant_by_plant_id

class PlantListSerializers(serializers.ModelSerializer):
    
    class Meta:
        model = Plant
        fields = '__all__'


class PlantSerializers(serializers.ModelSerializer):
    similar_plants = serializers.SerializerMethodField()

    class Meta:
        model = Plant
        fields = '__all__'

    def get_similar_plants(self, obj):
        similart_plants = find_similar_plant_by_plant_id(obj.id)
        return similart_plants