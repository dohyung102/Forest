# Generated by Django 4.0.3 on 2022-03-23 05:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('plant', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='plant',
            name='image_path',
            field=models.CharField(default='', max_length=50),
        ),
        migrations.AlterField(
            model_name='plant',
            name='name',
            field=models.CharField(default='', max_length=50),
        ),
    ]
