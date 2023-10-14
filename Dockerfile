FROM python:3.9

RUN useradd -m -d /home/appuser -s /bin/bash appuser
RUN chown -R appuser /app

USER appuser

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r /app/requirements.txt

COPY main.py /app
EXPOSE 7860

CMD ["python", "main.py"]