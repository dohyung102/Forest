from dataclasses import field
from numpy import source
from rest_framework import serializers
from .models import Post, Comment
# from accounts.serializers import CustomUserDetailSerializer
from plant.recomm_functions import find_similar_plant_by_plant_id


class CommentSerializers(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source = 'user.email')
    post = serializers.ReadOnlyField(source = 'post.pk')

    class Meta:
        model = Comment
        fields = '__all__'

class PostSerializers(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source = 'user.email')
    comment_set = CommentSerializers(read_only=True, many=True)

    class Meta:
        model = Post
        fields = '__all__'

    
        
        


