from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager


class UserManager(BaseUserManager):
    """
    Custom user model manager where email is the unique identifiers
    for authentication instead of usernames.
    """

    def create_user(self, email, password, **extra_fields):
        """
        Create and save a User with the given email and password.
        """
        if not email:
            raise ValueError('The Email must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, email, password, **extra_fields):
        """
        Create and save a SuperUser with the given email and password.
        """
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError(_('Superuser must have is_staff=True.'))
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(_('Superuser must have is_superuser=True.'))
        return self.create_user(email, password, **extra_fields)


class User(AbstractUser):
    username = None
    email = models.EmailField(unique=True, max_length=255)
    nickname = models.CharField(default='', max_length=50)
    birthday = models.DateField(null=True)
    gender = models.CharField(null=True, max_length=2)
    profile_image = models.ImageField(upload_to='images/users/', blank=True, null=True)
    role = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def __str__(self):
        return self.email

class Preference(models.Model):
    watering = models.CharField(max_length=255, default='')
    flower_presence = models.CharField(max_length=255, default='')
    manage_difficulty = models.CharField(max_length=255, default='')
    growth_rate = models.CharField(max_length=255, default='')
    placement = models.CharField(max_length=255, default='')
    index = models.IntegerField(default=0)

    user = models.ForeignKey(User, on_delete=models.CASCADE)
