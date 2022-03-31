from .base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = ['*']

DATABASES = {
    'default': { 
    	'ENGINE': 'django.db.backends.mysql', 
        'NAME': 'forest', 
        'USER': 'ssafy', 
        'PASSWORD': 'ssafy', 
        'HOST': 'db', 
        'PORT': '3306',
     } 
}