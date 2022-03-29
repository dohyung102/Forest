"""
Django settings for forest project.

Generated by 'django-admin startproject' using Django 4.0.3.

For more information on this file, see
https://docs.djangoproject.com/en/4.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.0/ref/settings/
"""

from pathlib import Path
import os, json, sys
import pymysql

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent

# 소셜 로그인 key 값 불러오는 부분
ROOT_DIR = os.path.dirname(BASE_DIR)

SECRET_BASE_FILE = os.path.join(ROOT_DIR, 'secrets.json')

secrets = json.loads(open(SECRET_BASE_FILE).read())
for key, value in secrets.items():
    setattr(sys.modules[__name__], key, value)

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-lw$gi)rijoq59yfc(0x7lx**m_*ynlt^j&mo-&xmqlnw$lo*3x'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    'django.contrib.sites',

    # django-rest-framework
    'rest_framework',
    'rest_framework.authtoken',
    'rest_framework_simplejwt.token_blacklist',

    # dj-rest-auth
    'dj_rest_auth',
    'dj_rest_auth.registration',

    # django-allauth
    'allauth',
    'allauth.account',
    'allauth.socialaccount',
    'allauth.socialaccount.providers.google',

    # apps
    'accounts.apps.AccountsConfig',
    'plant.apps.PlantConfig',
    'product.apps.ProductConfig',
    'store.apps.StoreConfig',
    'post.apps.PostConfig',

    'corsheaders',
]


SITE_ID = 1

AUTH_USER_MODEL = 'accounts.User'

AUTHENTICATION_BACKENDS = (
    #Needed to login by username in Django admin, regardless of 'allauth'
    'django.contrib.auth.backends.ModelBackend',
    
    # 'allauth' specific authentication methods, such as login by e-mail
    'allauth.account.auth_backends.AuthenticationBackend',
)

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'corsheaders.middleware.CorsMiddleware',
]

ROOT_URLCONF = 'forest.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'forest.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': BASE_DIR / 'db.sqlite3',
#     }
# }

pymysql.install_as_MySQLdb()

DATABASES = {
    'default': { 
    	'ENGINE': 'django.db.backends.mysql', 
        'NAME': 'forest', 
        'USER': 'ssafy', 
        'PASSWORD': 'ssafy', 
        'HOST': 'localhost', 
        'PORT': '3306',
     } 
}
# Password validation
# https://docs.djangoproject.com/en/4.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# rest framework

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',
    ),
    'DEFAULT_AUTHENTICATION_CLASSES': [
        # 'rest_framework.authentication.SessionAuthentication',
        'rest_framework_simplejwt.authentication.JWTAuthentication',
        # 'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
        'dj_rest_auth.jwt_auth.JWTCookieAuthentication',
    ], 
}

# django-allauth
# USER 필드 설정에 맞게 변경

ACCOUNT_USER_MODEL_USERNAME_FIELD = None # username 필드 사용 x
ACCOUNT_USERNAME_REQUIRED = False        # username 필드 사용 x
ACCOUNT_AUTHENTICATION_METHOD = 'email'
ACCOUNT_EMAIL_REQUIRED = True            # email 필드 사용 o
ACCOUNT_UNIQUE_EMAIL = True
ACCOUNT_EMAIL_VERIFICATION = 'mandatory'

ACCOUNT_ADAPTER = 'accounts.adapters.CustomAccountAdapter'

# dj-rest-auth
# JWT 환경 설정

REST_AUTH_REGISTER_SERIALIZERS = {
    'REGISTER_SERIALIZER': 'accounts.serializers.CustomRegisterSerializer'
}

REST_AUTH_SERIALIZERS = {
    'USER_DETAILS_SERIALIZER': 'accounts.serializers.CustomUserDetailSerializer'
}

REST_SESSION_LOGIN = False
REST_USE_JWT = True

from datetime import timedelta
SIMPLE_JWT = {
    'ACCESS_TOKEN_LIFETIME': timedelta(hours=2),
    'REFRESH_TOKEN_LIFETIME': timedelta(days=7),
    'ROTATE_REFRESH_TOKENS': False,
    'BLACKLIST_AFTER_ROTATION': True,
}

# Internationalization
# https://docs.djangoproject.com/en/4.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.0/howto/static-files/

STATIC_URL = 'static/'

# Default primary key field type
# https://docs.djangoproject.com/en/4.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# MEDIA 관련 설정

MEDIA_ROOT = os.path.join(BASE_DIR.parent, 'media')
MEDIA_URL = '/media/'

# Email 관련 설정
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
EMAIL_USE_TLS = True                    # TLS 보안 방법
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587                      # gmail과 통신하는 포트
EMAIL_HOST_USER = 'swkim0128@gmail.com' # 발신할 이메일
EMAIL_HOST_PASSWORD = '86TsCpvx8p99'    # 발신할 메일의 비밀번호
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER

ACCOUNT_CONFIRM_EMAIL_ON_GET = True     # 유저가 받은 링크를 클릭하면 회원가입 완료되게끔

# EMAIL_CONFIRMATION_AUTHENTICATED_REDIRECT_URL = '/' # 사이트와 관련한 자동응답을 받을 이메일 주소,'webmaster@localhost'
ACCOUNT_EMAIL_CONFIRMATION_EXPIRE_DAYS = 1

CORS_ORIGIN_WHITELIST = [
"http://localhost:3000"

]