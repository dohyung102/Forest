# Generated by Django 4.0.3 on 2022-03-25 07:02

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Plant',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=50)),
                ('image_path', models.ImageField(blank=True, null=True, upload_to='images/plants/')),
                ('character', models.TextField(default='')),
                ('watering', models.TextField(default='')),
                ('light_demand', models.CharField(default='', max_length=255)),
                ('huumidity', models.CharField(default='', max_length=50)),
                ('flower_presence', models.CharField(default='', max_length=3)),
                ('flower_color', models.CharField(default='', max_length=50)),
                ('manage_defficulty', models.CharField(default='', max_length=50)),
                ('winter_minimum_temperature', models.CharField(default='', max_length=50)),
                ('growth_rate', models.CharField(default='', max_length=50)),
                ('placement', models.CharField(default='', max_length=255)),
            ],
        ),
    ]
