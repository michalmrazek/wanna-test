FROM python:3.8.13-slim

# Install gcloud
RUN apt-get update && apt-get install apt-transport-https ca-certificates gnupg curl -y
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-cli -y

# Install wanna and jupyter for tutorials
ARG WANNA_VERSION
RUN pip install wanna-ml-test==$WANNA_VERSION jupyterlab

RUN useradd -ms /bin/bash  wanna-tester
WORKDIR /usr/local/bin/wanna-tester
# Copy samples and tutorials
COPY samples samples
COPY tutorials tutorials