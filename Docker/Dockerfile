FROM python:3.7
 
WORKDIR /app
 
COPY requirements.txt .
RUN pip install -r requirements.txt
 
EXPOSE 8000
COPY . . 
 
ENV ENVIRONMENT=DEV
ENV PORT=8000
ENV REDIS_PORT=6379
ENV REDIS_DB=0
CMD [ "python" , "hello.py" ]
