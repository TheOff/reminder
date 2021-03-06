# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-10-11 15:54
from __future__ import unicode_literals

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Notification',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('note', models.TextField(default='')),
                ('periodicity', models.PositiveSmallIntegerField(choices=[(1, 'Not periodic'), (2, 'Daily'), (3, 'Weekly'), (4, 'Monthly'), (5, 'Annually')], db_index=True, default=1)),
                ('year', models.PositiveSmallIntegerField(blank=True, db_index=True, null=True)),
                ('month', models.PositiveSmallIntegerField(blank=True, choices=[(1, 'January'), (2, 'February'), (3, 'March'), (4, 'April'), (5, 'May'), (6, 'June'), (7, 'July'), (8, 'August'), (9, 'September'), (10, 'October'), (11, 'November'), (12, 'December')], db_index=True, null=True)),
                ('day', models.PositiveSmallIntegerField(blank=True, db_index=True, null=True, validators=[django.core.validators.MaxValueValidator(31, 'Day cannot be more than 31')])),
                ('day_of_week', models.PositiveSmallIntegerField(blank=True, choices=[(1, 'Monday'), (2, 'Tuesday'), (3, 'Wednesday'), (4, 'Thursday'), (5, 'Friday'), (6, 'Saturday'), (7, 'Sunday')], db_index=True, null=True)),
                ('time', models.TimeField(db_index=True)),
            ],
        ),
    ]
