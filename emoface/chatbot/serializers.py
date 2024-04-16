from rest_framework import serializers
from chatbot.models import Cbot

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=Cbot
        fields='__all__'