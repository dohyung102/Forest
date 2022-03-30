FROM python:3.9

WORKDIR /app

COPY requirements.txt ./

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh .
RUN chmod +x ./wait-for-it.sh 

RUN export DJANGO_SETTINGS_MODULE=config.settings.prod

EXPOSE 8000
