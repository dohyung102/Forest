from django.db import models

# Create your models here.
class Store(models.Model):
    name = models.CharField(default='', max_length=50)
    profile_image = models.CharField(default='', max_length=100)
