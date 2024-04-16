from django.shortcuts import render
from django.http import HttpResponse
from questions.models import Questions
from rest_framework.views import APIView,Response
from questions.serializers import android_serialiser
from django.http import HttpResponse
from questions.models import Questions

class questionsdetails(APIView):
    def post(self,request):
        ob=Questions()
        ob.question_no = request.data['question_no']
        ob.question = request.data['question']
        ob.option_1 = request.data['option_1']
        ob.option_2 = request.data['option_2']
        ob.option_3 = request.data['option_3']
        ob.option_4 = request.data['option_4']
        ob.save()
        # ab=Questions()
        # ab.question_no = ob.question_no
        # ab.question = ob.question
        # ab.option_1 = ob.option_1
        # ab.option_2 = ob.option_2
        # ab.option_3 = ob.option_3
        # ab.option_4 = ob.option_4
        # ab.save()

        return HttpResponse('yes')
    def get(self,request):
        ob = Questions.objects.all()
        ser = android_serialiser(ob,many=True)
        return Response(ser.data)

class questionsdetailsoption(APIView):
    def get(self,request):
        ob = Questions.objects.all()
        ser = android_serialiser(ob,many=True)
        return Response(ser.data)
