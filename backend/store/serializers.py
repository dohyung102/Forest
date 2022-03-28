from dataclasses import field
from rest_framework import serializers
from .models import Store

class StoreSerializers(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source = 'user.email')

    class Meta:
        model = Store
        fields = '__all__'