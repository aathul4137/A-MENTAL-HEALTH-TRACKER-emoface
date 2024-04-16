from django.db import models

# Create your models here.
class Result(models.Model):
    result_id = models.AutoField(primary_key=True)
    result = models.CharField(max_length=20)
    q_no = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = 'result'
