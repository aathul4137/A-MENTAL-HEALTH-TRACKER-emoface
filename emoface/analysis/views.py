from django.shortcuts import render
from django.http import HttpResponse
from analysis.models import Analysis
from rest_framework.views import APIView,Response
from analysis.serializers import android_serialiser
from django.http import HttpResponse
from analysis.models import Analysis

class analysisdetails(APIView):
    def post(self,request):
        ob = Analysis()
        ob.u_id = request.data['u_id']
        ob.question_no = request.data['question_no']
        ob.result = request.data['result']
        ob.save()
        ab = Analysis()
        ab.u_id = ob.u_id
        ab.question_no = ob.question_no
        ab.result = ob.result
        ab.save()

        return HttpResponse('yes')
    def get(self,request):
        ob = Analysis.objects.all()
        ser = android_serialiser(ob,many=True)
        return Response(ser.data)

