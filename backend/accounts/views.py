from http import client
import requests
from django.conf import settings
from django.http import JsonResponse
from django.shortcuts import redirect
from json.decoder import JSONDecodeError
from rest_framework import status, viewsets
from rest_framework.response import Response

from allauth.socialaccount.models import SocialAccount
from allauth.socialaccount.providers.google.views import GoogleOAuth2Adapter
from allauth.socialaccount.providers.oauth2.client import OAuth2Client
from dj_rest_auth.registration.views import SocialLoginView, SocialConnectView

from accounts.models import User, Preference
from .serializers import CustomUserDetailSerializer, PreferenceSerializer, UserGetRoleSerializer

from plant.recomm_functions import calculate_recommend_plants_by_user_preference, find_preference_plants_by_index

from accounts import serializers

# state = getattr(settings, 'STATE')
BASE_URL = 'http://localhost:8000/'
GOOGLE_CALLBACK_URI = BASE_URL + 'accounts/google/login/callback/'

# def google_login(request):
#     """
#     Code Request
#     """
#     scope = "https://www.googleapis.com/auth/userinfo.email"
#     client_id = getattr(settings, "SOCIAL_AUTH_GOOGLE_CLIENT_ID")
#     return redirect(f"https://accounts.google.com/o/oauth2/v2/auth?client_id={client_id}&response_type=code&redirect_uri={GOOGLE_CALLBACK_URI}&scope={scope}")


# def google_callback(request):
#     client_id = getattr(settings, "SOCIAL_AUTH_GOOGLE_CLIENT_ID")
#     client_secret = getattr(settings, "SOCIAL_AUTH_GOOGLE_SECRET")
#     code = request.GET.get('code')

#     """
#     Access Token Request
#     """
#     token_req = requests.post(
#         f"https://oauth2.googleapis.com/token?client_id={client_id}&client_secret={client_secret}&code={code}&grant_type=authorization_code&redirect_uri={GOOGLE_CALLBACK_URI}&state={state}")
#     token_req_json = token_req.json()
#     error = token_req_json.get("error")
#     if error is not None:
#         raise JSONDecodeError(error)
#     access_token = token_req_json.get('access_token')

#     """
#     Email Request
#     """
#     email_req = requests.get(
#         f"https://www.googleapis.com/oauth2/v1/tokeninfo?access_token={access_token}")
#     email_req_status = email_req.status_code
#     if email_req_status != 200:
#         return JsonResponse({'err_msg': 'failed to get email'}, status=status.HTTP_400_BAD_REQUEST)
#     email_req_json = email_req.json()
#     email = email_req_json.get('email')

#     """
#     Signup or Signin Request
#     """
#     try:
#         user = User.objects.get(email=email)

#         # 기존에 가입된 유저의 Provider가 google이 아니면 에러 발생, 맞으면 로그인
#         # 다른 SNS로 가입된 유저
#         social_user = SocialAccount.objects.get(user=user)
#         if social_user is None:
#             return JsonResponse({'err_msg': 'email exists but not social user'}, status=status.HTTP_400_BAD_REQUEST)
#         if social_user.provider != 'google':
#             return JsonResponse({'err_msg': 'no matching social type'}, status=status.HTTP_400_BAD_REQUEST)

#         # 기존에 Google로 가입된 유저
#         data = {'access_token': access_token, 'code': code}
#         accept = requests.post(
#             f"{BASE_URL}accounts/google/login/finish/", data=data)
#         accept_status = accept.status_code
#         if accept_status != 200:
#             return JsonResponse({'err_msg': 'failed to signin'}, status=accept_status)
#         accept_json = accept.json()
#         accept_json.pop('user', None)

#         return JsonResponse(accept_json)
#     except User.DoesNotExist:
#         # 기존에 가입된 유저가 없으면 새로 가입
#         data = {'access_token': access_token, 'code': code}
#         accept = requests.post(
#             f"{BASE_URL}accounts/google/login/finish/", data=data)
#         accept_status = accept.status_code
#         if accept_status != 200:
#             return JsonResponse({'err_msg': 'failed to signup'}, status=accept_status)
#         accept_json = accept.json()
#         accept_json.pop('user', None)
#         return JsonResponse(accept_json)


class GoogleLogin(SocialLoginView):
    adapter_class = GoogleOAuth2Adapter
    callback_url = GOOGLE_CALLBACK_URI
    client_class = OAuth2Client

class GoogleConnect(SocialConnectView):
    adapter_class = GoogleOAuth2Adapter
    callback_url = GOOGLE_CALLBACK_URI
    client_class = OAuth2Client


class PreferenceViewSet(viewsets.ModelViewSet):
    queryset = Preference.objects.all()
    serializer_class = PreferenceSerializer

    def create(self, request):
        serialzer = PreferenceSerializer(data=request.data)
        if serialzer.is_valid(raise_exception=True):
            index = calculate_recommend_plants_by_user_preference(request.data)
            serialzer.save(index = index)
            user_preference_plants = find_preference_plants_by_index(index)
            return Response(user_preference_plants, status=status.HTTP_201_CREATED)

    def retrieve(self, request, pk):
        preference = Preference.objects.get(pk=pk)
        index = preference['index']
        user_preference_plants = find_preference_plants_by_index(index)
        return Response(user_preference_plants, status=status.HTTP_200_OK)

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserGetRoleSerializer

    def getrole(self, request, pk):
        user = User.objects.get(pk=pk)
        serializer = UserGetRoleSerializer(instance=user, data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save(role=True)
            return Response(serializer.data, status=status.HTTP_200_OK)