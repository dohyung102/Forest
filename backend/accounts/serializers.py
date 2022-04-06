from rest_framework import serializers
from rest_framework_simplejwt.tokens import RefreshToken
from dj_rest_auth.registration.serializers import RegisterSerializer
from dj_rest_auth.serializers import UserDetailsSerializer
from post.serializers import PostSerializers, CommentSerializers
from product.serializers import BuySerializers, WishlistSerializers, ReviewSerializers

from .models import Preference, User

class CustomRegisterSerializer(RegisterSerializer):
    nickname = serializers.CharField()

    def get_cleaned_data(self):
        data = super().get_cleaned_data()
        data['nickname'] = self._validated_data.get('nickname', '')
        return data
    
    class Meta:
        model = User
        fields = '__all__'


class PreferenceSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source='user.email')

    class Meta:
        model = Preference
        fields = '__all__'
        read_only_fields = ['index']


class CustomUserDetailSerializer(UserDetailsSerializer):
    comment_set = CommentSerializers(read_only=True, many=True)
    post_set = PostSerializers(read_only=True, many=True)
    nickname = serializers.CharField()
    gender = serializers.CharField()
    buy_set = BuySerializers(read_only=True, many=True)
    wishlist_set = WishlistSerializers(read_only=True, many=True)
    preference_set = PreferenceSerializer(read_only=True, many=True)
    review_set = ReviewSerializers(read_only=True, many=True)
    store_set = serializers.ReadOnlyField(source = 'store.pk')

    def get_cleaned_data(self):
        data = super().get_cleaned_data()
        data['nickname'] = self._validated_data.get('nickname', '')
        data['gender'] = self._validated_data.get('gender', '')
        return data

    class Meta:
        model = User
        fields = '__all__'

class CustomTokenRefreshSerializer(serializers.ModelSerializer):
    refresh_token = serializers.CharField()

    def validate(self, attrs):
        refresh = RefreshToken(attrs['refresh_token'])
        data = {'access_token': str(refresh.access_token)}

        return data



class UserGetRoleSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ['role']
        read_only_fields = ['role']