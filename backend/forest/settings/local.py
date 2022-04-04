from .base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

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