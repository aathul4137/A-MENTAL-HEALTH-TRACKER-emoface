from django.conf.urls import url
from register import views
urlpatterns=[
    url('postdata/',views.registerdetails.as_view())

]