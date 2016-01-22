import time
import traceback

import django
django.setup()

from testapp.models import Simple


def show_error():
    simple = Simple.objects.create(data={'a': 1, 'b': 'B'})

    Simple.objects.filter(id=simple.id).update(data={'a': 2, 'b': 'C'})


if __name__ == '__main__':
    # Wait for DB to start up
    try:
        show_error()
    except:
        traceback.print_exc()

    # Loop so that docker container stays up
    while True:
        time.sleep(10)
