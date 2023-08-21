FROM python:3.9

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r /app/requirements.txt

# # Set up a new user named "user" with user ID 1000
# RUN useradd -m -u 1000 user

# # Switch to the "user" user
# USER user

# # Set home to the user's home directory
# ENV HOME=/home/user \
#   PATH=/home/user/.local/bin:$PATH

# # Set the working directory to the user's home directory
# WORKDIR $HOME/app

COPY main.py /app
EXPOSE 7860

# Copy the current directory contents into the container at $HOME/app setting the owner to the user
# COPY --chown=user . $HOME/app

CMD ["python", "main.py"]