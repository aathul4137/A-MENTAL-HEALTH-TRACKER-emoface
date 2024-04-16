from rest_framework import serializers
from analysis.models import Analysis

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=Analysis
        fields='__all__'