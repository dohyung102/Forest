from dataclasses import field
from matplotlib import use
from rest_framework import serializers
from .models import Plant
from .recomm_functions import find_similar_plant_by_plant_id
from product.models import Product

class ProductSerializers(serializers.ModelSerializer):
    
    class Meta:
        model = Product
        fields = '__all__'


class PlantListSerializers(serializers.ModelSerializer):
    image_path = serializers.ImageField(use_url=False)   
    class Meta:
        model = Plant
        fields = '__all__'


class PlantSerializers(serializers.ModelSerializer):
    similar_plants = serializers.SerializerMethodField()
    product_set = ProductSerializers(read_only=True, many=True)
    image_path = serializers.ImageField(use_url=False)   

    class Meta:
        model = Plant
        fields = '__all__'

    def get_similar_plants(self, obj):
        similart_plants = find_similar_plant_by_plant_id(obj.id)
        return similart_plants