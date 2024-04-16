from django.shortcuts import render
from django.http import HttpResponse
from result.models import Result
from rest_framework.views import APIView,Response
from result.serializers import android_serialiser
from django.http import HttpResponse
from result.models import Result
from emoface import settings
from pandas import read_excel
from sklearn.tree import DecisionTreeClassifier

class resultdetails(APIView):
    def post(self,request):
        # obb=Result.objects.all().delete()
        ob=Result()
        ob.result = request.data['result']
        ob.q_no=request.data['q_no']
        print(ob.q_no)
        ob.save()

        if ob.q_no=="19":
            ab = Result.objects.all().order_by("result_id")
            b = []
            for i in ab:
                b.append(i.result)

            a1 = b[0]
            a2 = b[1]
            a3 = b[2]
            a4 = b[3]
            a5 = b[4]
            a6 = b[5]
            a7 = b[6]
            a8 = b[7]
            a9 = b[8]
            a10 = b[9]
            a11 = b[10]
            a12 = b[11]
            a13 = b[12]
            a14 = b[13]
            a15 = b[14]
            a16 = b[15]
            a17 = b[16]
            a18 = b[17]
            a19 = b[18]
            a20 = b[19]
            imgpath = str(settings.BASE_DIR) + str(settings.STATIC_URL) + "qd.xlsx"
            data = read_excel(imgpath, "Sheet1")
            X = data.iloc[:, 0:20].values
            y = data.iloc[:, 20].values
            dtc = DecisionTreeClassifier()
            dtc.fit(X, y)
            # test = [int(a1),int(a2),int(a3),int(a4),int(a5),int(a6),int(a7),int(a8),int(a9),int(a10),int(a11),int(a12),
            #         int(a13),int(a14),int(a15),int(a16),int(a17),int(a18),int(a19),int(a20),int(a21),int(a22),int(a23),int(a24),
            #         int(a25),int(a26),int(a27),int(a28),int(a29),int(a30),int(a31),int(a32),int(a33),int(a34),int(a35),int(a36),
            #         int(a37),int(a38),int(a39),int(a40),int(a41)]

            test = [int(a1), int(a2), int(a3), int(a4), int(a5), int(a6), int(a7), int(a8), int(a9), int(a10), int(a11),
                    int(a12),
                    int(a13), int(a14), int(a15), int(a16), int(a17), int(a18), int(a19), int(a20)]
            y_pred = dtc.predict([test])
            print("result : "+ y_pred)
            obb = Result.objects.all()
            obb.delete()
            return HttpResponse(str(y_pred[0]))
        return HttpResponse('yes')
    def get(self,request):
        ob=Result.objects.all()
        ser=android_serialiser(ob,many=True)
        return Response(ser.data)


class predict(APIView):
    def post(self,request):
        ab=Result.objects.all().order_by("result_id")
        b=[]
        for i in ab:
            b.append(i.result)


        a1=b[0]
        a2=b[1]
        a3=b[2]
        a4=b[3]
        a5=b[4]
        a6=b[5]
        a7 = b[6]
        a8 = b[7]
        a9 = b[8]
        a10 = b[9]
        a11= b[10]
        a12= b[11]
        a13 = b[12]
        a14 = b[13]
        a15 = b[14]
        a16 = b[15]
        a17 = b[16]
        a18 = b[17]
        a19=b[18]
        a20=b[19]
        imgpath = str(settings.BASE_DIR) + str(settings.STATIC_URL) + "qd.xlsx"
        data = read_excel(imgpath, "Sheet1")
        X = data.iloc[:, 0:20].values
        y = data.iloc[:, 20].values
        dtc = DecisionTreeClassifier()
        dtc.fit(X, y)
        # test = [int(a1),int(a2),int(a3),int(a4),int(a5),int(a6),int(a7),int(a8),int(a9),int(a10),int(a11),int(a12),
        #         int(a13),int(a14),int(a15),int(a16),int(a17),int(a18),int(a19),int(a20),int(a21),int(a22),int(a23),int(a24),
        #         int(a25),int(a26),int(a27),int(a28),int(a29),int(a30),int(a31),int(a32),int(a33),int(a34),int(a35),int(a36),
        #         int(a37),int(a38),int(a39),int(a40),int(a41)]

        test = [int(a1), int(a2), int(a3), int(a4), int(a5), int(a6), int(a7), int(a8), int(a9), int(a10), int(a11),
                int(a12),
                int(a13), int(a14), int(a15), int(a16), int(a17), int(a18), int(a19), int(a20)]
        y_pred = dtc.predict([test])
        #
        print(y_pred)
        # context = {
        #     'aa': y_pred
        # }
        request.session['req']=y_pred[0]

        # print(b1)
        return HttpResponse("yess")

    def get(self, request):
        a=request.session['req']
        return Response(a)



# class res(APIView):
#     def get(self,request):
#         a=request.session['req']
#         return HttpResponse(a)