from distutils.command.upload import upload
from email.policy import default
from django.db import models
from numpy import blackman
from accounts.models import User

# Create your models here.

class Post(models.Model):
    title = models.CharField(default='', max_length=50)
    content = models.CharField(default='', max_length=50)
    image = models.ImageField(upload_to='images/posts/', null=True, blank=True, default='', max_length=50)
    tag = models.CharField(default='', null=True, max_length=50)
    created_date = models.DateField(auto_now_add=True)

    user = models.ForeignKey(User, on_delete=models.CASCADE)


class Comment(models.Model):
    content = models.CharField(default='', max_length=50)
    create_date = models.DateField(auto_now_add=True)

    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
