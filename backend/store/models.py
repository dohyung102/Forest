from distutils.command.upload import upload
from django.db import models

from accounts.models import User

# Create your models here.
class Store(models.Model):
    name = models.CharField(default='', max_length=50)
<<<<<<< HEAD
    profile_image = models.ImageField(upload_to='images/stores/', blank=True, null=True)
=======
    profile_image = models.CharField(default='', max_length=100)
    user = models.OneToOneField(User, on_delete=models.CASCADE, default='')
>>>>>>> 2f07ce2509cf6ac89b04e1a42af8bad77bf94bb7
