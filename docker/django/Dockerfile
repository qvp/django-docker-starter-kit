FROM python:3.7.1
ENV PYTHONUNBUFFERED 1

# update package lists, fix broken system packages
RUN apt-get update
RUN apt-get -f install

# install and cache dependencies in /tmp directory.
# doing it this way also installs any newly added dependencies.
RUN pip3 install --upgrade pip
ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

# create user and add to docker group
RUN adduser --disabled-password --gecos '' django
RUN groupadd docker
RUN usermod -aG docker django

# grant newly created user permissions on essential files
RUN mkdir /app
RUN mkdir ~/scripts/
RUN chown -R django:django ~/
RUN chown -R django:django ~/scripts/
RUN chown -R django:django /app/

# load django/* files and set work directory
ADD start.sh /home/django/scripts/
ADD wait_for_postgres.sh /home/django/scripts/

RUN ["chmod", "+x", "/home/django/scripts/wait_for_postgres.sh"]
RUN ["chmod", "+x", "/home/django/scripts/start.sh"]
