from django.conf.urls import url
from login import views
urlpatterns=[
    url('log/',views.login_view.as_view())
]