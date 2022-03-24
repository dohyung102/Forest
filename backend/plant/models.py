from django.db import models

# Create your models here.
class Plant(models.Model):
    name = models.CharField(default='', max_length=50)
    image_path = models.CharField(default='', max_length=50)
    character = models.TextField(default='')
    watering = models.TextField(default='')
    light_demand = models.CharField(default='', max_length=255)
    huumidity = models.CharField(default='', max_length=50)
    flower_presence = models.CharField(default='', max_length=3)
    flower_color = models.CharField(default='', max_length=50)
    manage_defficulty = models.CharField(default='', max_length=50)
    winter_minimum_temperature = models.CharField(default='', max_length=50)
    growth_rate = models.CharField(default='', max_length=50)
    placement = models.CharField(default='', max_length=255)
