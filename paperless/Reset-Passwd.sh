#!/usr/bin/bash
docker exec -it paperless-webserver-1 sh
python3 manage.py --help
python3 manage.py changepassword --username <user>
python3 manage.py createsuperuser --username  <user>