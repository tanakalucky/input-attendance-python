FROM python:3.11-slim-buster

RUN apt-get update && apt-get install -y git vim locales-all gnupg wget curl

# Adding trusting keys to apt for repositories
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    # Adding Google Chrome to the repositories
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    # Updating apt to see and install Google Chrome
    apt-get -y update && \
    apt-get install -y google-chrome-stable && \
    # Installing Unzip
    apt-get install -yqq unzip && \
    # Download the Chrome Driver
    wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip && \
    # Unzip the Chrome Driver into /usr/local/bin directory
    unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# Set display port as an environment variable
ENV DISPLAY=:99

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

WORKDIR /workdir

COPY . .

RUN pip install --upgrade pip

RUN pip install -r requirements.txt