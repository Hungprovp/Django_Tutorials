FROM python:3.8

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN apt-get update \
    && apt-get -y install vim libpq-dev gcc build-essential apt-utils nginx gettext \
    && pip install --upgrade pip \
    && pip install psycopg2
RUN pip install gunicorn

COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . .
RUN mkdir -p logs /var/www/html/static
RUN cp -ar staticfiles/* /var/www/html/static/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]