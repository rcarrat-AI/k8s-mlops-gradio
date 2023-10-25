FROM registry.access.redhat.com/ubi8/python-39

USER root

RUN dnf -y update \
  && dnf -y install python3-pip \
  && dnf -y clean all \
  && rm -rf /var/cache/dnf \
  && pip install pip==22.3.1 setuptools==65.3.0

USER 1001

COPY ./requirements.txt /app/requirements.txt
RUN pip3 install --no-cache-dir -r /app/requirements.txt

# Copy the application files
COPY *.py ./

# Run the application
CMD python3 main.py