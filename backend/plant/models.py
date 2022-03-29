from django.db import models

# Create your models here.
class Plant(models.Model):
    name = models.CharField(default='', max_length=50)
    image_path = models.ImageField(upload_to='images/plants/', blank=True, null=True)
    character = models.TextField(default='', null=True)
    watering = models.TextField(default='', null=True)
    light_demand = models.CharField(default='', max_length=255, null=True)
    humidity = models.CharField(default='', max_length=50, null=True)
    flower_presence = models.CharField(default='', max_length=3, null=True)
    flower_color = models.CharField(default='', max_length=50, null=True)
    manage_difficulty = models.CharField(default='', max_length=50, null=True)
    winter_minimum_temperature = models.CharField(default='', max_length=50, null=True)
    growth_rate = models.CharField(default='', max_length=50, null=True)
    placement = models.CharField(default='', max_length=255, null=True)
