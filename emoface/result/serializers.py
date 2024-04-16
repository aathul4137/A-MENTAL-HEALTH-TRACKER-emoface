from rest_framework import serializers
from result.models import Result

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=Result
        fields='__all__'