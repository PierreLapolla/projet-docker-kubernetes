# Generated by Django 5.1.3 on 2024-11-15 08:22

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('counter_app', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Compteur',
            new_name='Counter',
        ),
    ]