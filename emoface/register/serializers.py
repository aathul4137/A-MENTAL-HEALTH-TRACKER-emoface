from rest_framework import serializers
from register.models import Register

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=Register
        fields='__all__'