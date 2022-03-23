from curses.ascii import US
from django.db import models
from accounts.models import User

# Create your models here.

class Post(models.Model):
    title = models.CharField(default='', max_length=50)
    content = models.CharField(default='', max_length=50)
    image = models.CharField(default='', null=True, max_length=50)
    tag = models.CharField(default='', null=True, max_length=50)
    created_date = models.DateField()

    user = models.ForeignKey(User, on_delete=models.CASCADE)


class Comment(models.Model):
    content = models.CharField(default='', max_length=50)
    create_date = models.DateField()

    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
