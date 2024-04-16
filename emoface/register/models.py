from django.db import models

# Create your models here.
class Register(models.Model):
    register_id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=20)
    lastname = models.CharField(max_length=20)
    age = models.DateField()
    gender = models.CharField(max_length=10)
    email_id = models.CharField(max_length=30)
    password = models.CharField(max_length=11)

    class Meta:
        managed = False
        db_table = 'register'
