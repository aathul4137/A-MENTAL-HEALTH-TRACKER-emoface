from django.db import models

# Create your models here.
class Analysis(models.Model):
    user_id = models.IntegerField()
    question_no = models.IntegerField()
    answer = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'analysis'

