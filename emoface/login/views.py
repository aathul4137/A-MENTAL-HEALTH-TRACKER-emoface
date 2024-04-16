from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView,Response
from login.serializers import android_serialiser
from login.models import Login

class login_view(APIView):
    def get(self,request):
        ob = Login.objects.all()
        ser = android_serialiser(ob, many=True)
        return Response(ser.data)

    def post(self,request):
        Username = request.data['Username']
        Password = request.data['Password']
        ob = Login.objects.filter(username=Username,password=Password)
        ser = android_serialiser(ob, many=True)
        return Response(ser.data)
