# Generated by Django 5.1.3 on 2024-11-15 08:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('counter_app', '0002_rename_compteur_counter'),
    ]

    operations = [
        migrations.RenameField(
            model_name='counter',
            old_name='valeur',
            new_name='value',
        ),
    ]
