FROM python:3.9

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . .

RUN export DJANGO_SETTINGS_MODULE=config.settings.prod

EXPOSE 8000

ENTRYPOINT python manage.py runserver 0:8000 --settings=forest.settings.prod
