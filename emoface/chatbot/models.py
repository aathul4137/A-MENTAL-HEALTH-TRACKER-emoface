from django.db import models

# Create your models here.
class Cbot(models.Model):
    cbot_id = models.AutoField(primary_key=True)
    resp = models.CharField(max_length=100)
    quest = models.CharField(max_length=50)
    uid = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'cbot'
