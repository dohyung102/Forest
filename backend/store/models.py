from django.db import models

from accounts.models import User

# Create your models here.
class Store(models.Model):
    name = models.CharField(default='', max_length=50)
    profile_image = models.CharField(default='', max_length=100)
    user = models.OneToOneField(User, on_delete=models.CASCADE, default='')
