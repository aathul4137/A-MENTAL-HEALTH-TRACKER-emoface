from django.http import HttpResponse
from django.shortcuts import render
from chatbot.models import Cbot
from rest_framework.views import APIView,Response
# Create your views here.

from django.http import HttpResponse,JsonResponse
import re
import numpy as np
import nltk
from nltk.corpus import stopwords
stop_words = set(stopwords.words('english'))
from nltk.stem.snowball import SnowballStemmer
st = SnowballStemmer('english')

# Create your views here.
from chatterbot import ChatBot
from chatterbot.trainers import ListTrainer
from django.http import HttpResponse,JsonResponse
my_bot = ChatBot('ashik',logic_adapters=['chatterbot.logic.BestMatch'])

import pandas as pd
from emoface import settings

# fname=str(settings.BASE_DIR)+str(settings.STATIC_URL)+"nlpmentalhealthfaq.csv"
# print(fname)
data=pd.read_excel(str(settings.BASE_DIR)+str(settings.STATIC_URL)+"chatbot.xlsx")
# print(data.head())
ds=[]


def clean_data(df, col, clean_col):
    # change to lower and remove spaces on either side
    df[clean_col] = df[col].apply(lambda x: x.lower().strip())
    # remove extra spaces in between
    df[clean_col] = df[clean_col].apply(lambda x: re.sub(' +', ' ', x))
    # remove punctuation
    df[clean_col] = df[clean_col].apply(lambda x: re.sub('[^a-zA-Z]', ' ', x))
    # remove stopwords and get the stem
    df[clean_col] = df[clean_col].apply(lambda x: ' '.join(st.stem(text) for text in x.split() if text not in stop_words))

    #     df[clean_col] = df[clean_col].apply(lambda x: ' '.join(st.stem(text) x.split())

    return df

# data = clean_data(data, 'Questions', 'Quest')
data = clean_data(data, 'Questions', 'Answers')

print(data)
for index, row in data.iterrows():
    # print(row)
#
    # ms=row[2].split()
    # # print(ms)
    # ms.sort()
    # msg=""
    # for m in ms:
    #     msg=msg+" "+m
    # ds.append(msg.strip())
    # # print(msg)
    # ds.append(row[1])
    # # print(row[1])

    ms = row[2].split()
    print(ms)
    ms.sort()
    msg = ""
    for m in ms:
        msg = msg + " " + m
    ds.append(msg.strip())
    # print(msg)
    ds.append(row[2])
    # print(row[1])


def clean_msg(msg):

        # change to lower and remove spaces on either side
        msg = msg.lower().strip()

        # remove extra spaces in between
        msg = re.sub(' +', ' ', msg)

        # remove punctuation
        msg = re.sub('[^a-zA-Z]', ' ', msg)

        # remove stopwords and get the stem
        smsg = msg.split()
        # print(smsg)
        rmsg = ""
        for text in smsg:
            if text not in stop_words:
                #             print('haiii')
                rmsg = rmsg + " " + st.stem(text)

        rmsg = rmsg.split()
        rmsg.sort()
        msg = ""
        for m in rmsg:
            msg = msg + " " + m
        # print(rmsg)
        return msg
     # print(row[2])


#
# def index(request):
#     my_bot.storage.drop()
#
#     list_trainer = ListTrainer(my_bot)
#
#     list_trainer.train([
#         "hello",
#         "Hi, can I help you?",
#         # "Want to know about healthcare",
#         'what you know about backpain?',
#         'back pain is felt in back...episodes of back pain maybe acute,sub acute,or chronic depending on the duration',
#         'what are the causes?',
#         'there are servaral potential source and couses of back pain....However, the diagnosis of  the spin as the cause of pain present problems',
#         'symptoms of common cold?',
#         'block nose, brething difficulty, cough, headache',
#         'symptoms of joinpain ?',
#         'Swelling,Stiff or enlarged joint Numbness Noisy joints, or clicking, grinding, or snapping sounds when moving the joint,Painful movement Difficulty bending or straightening the joint.,Loss of motio',
#         'symptoms of Dengue?',
#         'High Fever, Rashes, Pain Behind Eyes - Know The Dengue',
#         'symptoms of chiken pox?',
#         'common: headache, itching, sore throat, or swollen lymph nodes,Whole body: fatigue, fever, or loss of appetite',
#         'symptoms of amal?',
#         'fake',
#
#
#
#         # "Mes kallamthode",
#         # "departments at college",
#         # "computer science, mathematics, physics"
#
#     ])
#     my_bot.storage.drop()
#     list_trainer = ListTrainer(my_bot)
#     list_trainer.train(ds)
#
#
#     return render(request,'message/chat.html')
#
# def chbottest(request):
#     my_bot.storage.drop()
#     list_trainer = ListTrainer(my_bot)
#     list_trainer.train(ds)
#
#     umsg = request.GET.get('cmsg')
#     umsg = clean_msg(umsg)
#     if my_bot.get_response(umsg).confidence < 0.5:
#         res= str("Sorry I do not understand that.")
#     else:
#         my_bot.get_response(umsg).confidence = 1
#         res= str(my_bot.get_response(umsg))
#
#     # res=my_bot.get_response(umsg.strip())
#     print(umsg)
#     print(res)
#     s=str(res)
#     context = {
#         "cresp": s,
#     }
#
#     return JsonResponse(context)




class chatbot(APIView):
    def post(self,request):
       temp=request.data['quest']
       u=request.data['uid']
       print(temp)


       my_bot.storage.drop()
       list_trainer = ListTrainer(my_bot)
       list_trainer.train(ds)

       # umsg = request.GET.get('cmsg')
       temp = clean_msg(temp)
       print('helpme')
       print(my_bot.get_response(temp).confidence)

       if my_bot.get_response(temp).confidence < 0.5:
           res = str("Sorry I do not understand that.")
       else:
           my_bot.get_response(temp).confidence = 1
           res = str(my_bot.get_response(temp))

       # res=my_bot.get_response(umsg.strip())
       print(temp)
       print(res)
       ab=Cbot.objects.get(uid=u)
       ab.delete()
       bc=Cbot()
       bc.resp=res
       bc.quest=temp
       bc.uid=u
       bc.save()
       # s = str(res)
       # context = {
       #     "cresp": s,
       # }
       return HttpResponse(res)
from chatbot.serializers import android_serialiser
class cbot(APIView):
    def get(self,request):
        ob=Cbot.objects.all()
        ser=android_serialiser(ob,many=True)
        return Response(ser.data)


