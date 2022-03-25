from rest_framework import serializers
from rest_framework_simplejwt.tokens import RefreshToken
from dj_rest_auth.registration.serializers import RegisterSerializer
from dj_rest_auth.serializers import UserDetailsSerializer

from .models import User

class CustomRegisterSerializer(RegisterSerializer):
    nickname = serializers.CharField()
    gender = serializers.CharField()

    def get_cleaned_data(self):
        data = super().get_cleaned_data()
        data['nickname'] = self._validated_data.get('nickname', '')
        data['gender'] = self._validated_data.get('gender', '')
        return data

class CustomUserDetailSerializer(UserDetailsSerializer):
    nickname = serializers.CharField()
    gender = serializers.CharField()

    def get_cleaned_data(self):
        data = super().get_cleaned_data()
        data['nickname'] = self._validated_data.get('nickname', '')
        data['gender'] = self._validated_data.get('gender', '')
        return data
    class Meta:
        fields = '__all__'
        model = User

class CustomTokenRefreshSerializer(serializers.Serializer):
    refresh_token = serializers.CharField()

    def validate(self, attrs):
        refresh = RefreshToken(attrs['refresh_token'])
        data = {'access_token': str(refresh.access_token)}

        return data