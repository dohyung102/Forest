from django.db import models

# Create your models here.
class Plant(models.Model):
    name = models.CharField(default='', max_length=50)
    image_path = models.CharField(default='', max_length=50)
