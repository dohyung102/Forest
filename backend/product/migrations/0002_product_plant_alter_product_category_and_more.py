# Generated by Django 4.0.3 on 2022-03-23 05:15

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('plant', '0002_alter_plant_image_path_alter_plant_name'),
        ('store', '0002_alter_store_name_alter_store_profile_image'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('product', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='plant',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='plant.plant'),
        ),
        migrations.AlterField(
            model_name='product',
            name='category',
            field=models.CharField(default='', max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='close_date',
            field=models.DateField(default=''),
        ),
        migrations.AlterField(
            model_name='product',
            name='description',
            field=models.CharField(default='', max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='name',
            field=models.CharField(default='test', max_length=50),
        ),
        migrations.AlterField(
            model_name='product',
            name='num',
            field=models.IntegerField(default=0, null=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='open_date',
            field=models.DateField(default=''),
        ),
        migrations.AlterField(
            model_name='product',
            name='price',
            field=models.IntegerField(default=0, null=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='profile_image',
            field=models.CharField(default='', max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='store',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='store.store'),
        ),
        migrations.CreateModel(
            name='Wishlist',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='product.product')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Review',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='제목없음', max_length=50)),
                ('context', models.CharField(default='본문내용없음', max_length=50)),
                ('star', models.IntegerField(default=0, null=True)),
                ('created_date', models.DateField()),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='product.product')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Buy',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='product.product')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
