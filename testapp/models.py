from django.contrib.postgres.fields import HStoreField
from django.db import models

# Create your models here.

class Simple(models.Model):
    data = HStoreField(default={})

