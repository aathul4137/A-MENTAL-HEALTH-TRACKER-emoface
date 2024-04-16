from django.conf.urls import url
from chatbot import views
urlpatterns=[
    url('chatbot/',views.chatbot.as_view()),
    url('vicb/',views.cbot.as_view())

]