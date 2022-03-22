from django.db import models
from store.models import Store

# Create your models here.

class Product(models.Model):
    name = models.CharField(max_length=50)
    price = models.IntegerField()
    num = models.IntegerField()
    open_date = models.DateField(max_length=50)
    close_date = models.DateField(max_length=50)
    category = models.CharField(max_length=50)
    description = models.CharField(max_length=100)
    profile_image = models.CharField(max_length=100)

    store = models.ForeignKey(Store, on_delete=models.CASCADE)