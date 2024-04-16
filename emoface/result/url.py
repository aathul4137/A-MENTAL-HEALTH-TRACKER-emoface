from django.conf.urls import url
from result import views
urlpatterns=[
    url('res/',views.resultdetails.as_view()),
    url('pre/',views.predict)
]