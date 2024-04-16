from django.conf.urls import url
from expression import views
urlpatterns=[
url('expr/',views.express),
    url('ptcap/',views.upimage)

]