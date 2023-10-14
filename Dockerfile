FROM python:3.9
USER appuser
WORKDIR /app

RUN groupadd -r appuser && useradd -r -g appuser -d /home/appuser -s /bin/bash appuser

RUN mkdir -p /app && \
  chown -R appuser:appuser /app

COPY ./requirements.txt /app/requirements.txt
COPY main.py /app
EXPOSE 7860

CMD ["python", "main.py"]