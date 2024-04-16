from rest_framework import serializers
from questions.models import Questions

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=Questions
        fields='__all__'