# Use an official Python runtime as a parent image
FROM python:3.7

# Set environment variables
ENV PYTHONUNBUFFERED 1

# # Install any needed packages specified in requirements.txt
RUN pip install pipenv

# Create directory
RUN mkdir /flaskapp

# Set the working directory to /flaskapp
WORKDIR /flaskapp

ADD Pipfile .
ADD Pipfile.lock .
RUN pipenv install --system --deploy --ignore-pipfile

RUN mkdir /app
WORKDIR /flaskapp/app
COPY ./app .

EXPOSE 8080

RUN chmod +x ./start_app.sh
ENTRYPOINT ./start_app.sh