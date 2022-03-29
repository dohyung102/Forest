from dataclasses import field
from rest_framework import serializers
from .models import Store
from product.serializers import ProductSerializers

class StoreSerializers(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source = 'user.email')
    product_set = ProductSerializers(read_only=True, many=True)

    class Meta:
        model = Store
        fields = '__all__'