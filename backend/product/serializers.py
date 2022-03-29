from dataclasses import field
from rest_framework import serializers
from .models import Product, Buy, Wishlist, Review

class ProductSerializers(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'


class BuySerializers(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source = 'user.email')
    product = ProductSerializers(read_only=True)

    class Meta:
        model = Buy
        fields = '__all__'


class WishlistSerializers(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source = 'user.email')
    product = ProductSerializers(read_only=True)

    class Meta:
        model = Wishlist
        fields = '__all__'


class ReviewSerializers(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source = 'user.email')
    product = serializers.ReadOnlyField(source = 'product.id')

    class Meta:
        model = Review
        fields = '__all__'