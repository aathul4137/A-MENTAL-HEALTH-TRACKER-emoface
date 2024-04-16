from django.conf.urls import url
from questions import views
urlpatterns=[
    url('ques/',views.questionsdetails.as_view())
]