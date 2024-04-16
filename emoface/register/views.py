from django.shortcuts import render
from django.http import HttpResponse
from register.models import Register
from rest_framework.views import APIView,Response
from register.serializers import android_serialiser
from django.http import HttpResponse
from login.models import Login

class registerdetails(APIView):
    def post(self,request):
        ob=Register()
        print(request.data['firstname'])
        print(request.data['lastname'])
        print(request.data['email_id'])
        print(request.data['age'])
        print(request.data['gender'])
        print(request.data['password'])
        ob.firstname=request.data['firstname']
        ob.lastname = request.data['lastname']
        ob.email_id = request.data['email_id']
        ob.age = request.data['age']
        ob.gender = request.data['gender']
        ob.password = request.data['password']
        ob.save()
        ab=Login()
        ab.username=ob.firstname
        ab.password=ob.password
        ab.type="user"
        ab.u_id=ob.register_id
        ab.save()

        return HttpResponse('yes')
    # def get(self,request):
    #     ob=Register.objects.all()
    #     ser=android_serialiser(ob,many=True)
    #     return Response(ser.data)

