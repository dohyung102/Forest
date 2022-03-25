from distutils.command.upload import upload
from django.db import models

from plant.models import Plant
from store.models import Store
from accounts.models import User

# Create your models here.

class Product(models.Model):
    name = models.CharField(default='test', max_length=50)
    price = models.IntegerField(default=0, null=True)
    num = models.IntegerField(default=0, null=True)
    open_date = models.DateField(default='')
    close_date = models.DateField(default='')
    category = models.CharField(default='', null=True, max_length=50)
    description = models.CharField(default='', null=True, max_length=100)
    profile_image = models.ImageField(upload_to='images/products/', blank=True, null=True)

    plant = models.ForeignKey(Plant, null=True, on_delete=models.CASCADE)
    store = models.ForeignKey(Store, null=True, on_delete=models.CASCADE)

class Buy(models.Model):
    date = models.DateField()

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

class Wishlist(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

class Review(models.Model):
    title = models.CharField(default='제목없음', max_length=50)
    context = models.CharField(default='본문내용없음', max_length=50)
    star = models.IntegerField(default=0, null=True)
    created_date = models.DateField(auto_now_add=True)

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)