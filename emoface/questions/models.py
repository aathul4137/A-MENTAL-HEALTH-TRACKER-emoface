from django.db import models

# Create your models here.


class Questions(models.Model):
    question_no = models.AutoField(db_column='question no', primary_key=True)  # Field renamed to remove unsuitable characters.
    question = models.CharField(max_length=100)
    option_1 = models.CharField(max_length=50)
    option_2 = models.CharField(max_length=50)
    option_3 = models.CharField(max_length=50)
    option_4 = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'questions'
