FROM python:3.6

WORKDIR /app
COPY requirements.txt .

RUN pip3 install --upgrade pip
RUN pip install -r requirements.txt



RUN useradd app

USER app
EXPOSE 8000
COPY . .

ENV FLASK_APP=src/app.py

CMD python setup.py && flask run --host=0.0.0.0 --port 8000