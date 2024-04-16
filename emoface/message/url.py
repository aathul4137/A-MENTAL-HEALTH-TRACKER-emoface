from django.conf.urls import url
from message import views
urlpatterns=[
    url('msg/',views.index),
    url('chat/',views.chbottest),

]