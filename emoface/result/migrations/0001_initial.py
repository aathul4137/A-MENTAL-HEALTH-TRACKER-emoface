# Generated by Django 3.2.18 on 2023-03-12 07:29

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Result',
            fields=[
                ('result_id', models.AutoField(primary_key=True, serialize=False)),
                ('result', models.CharField(max_length=20)),
            ],
            options={
                'db_table': 'result',
                'managed': False,
            },
        ),
    ]
