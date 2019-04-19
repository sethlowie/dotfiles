#! /bin/bash
cd /tmp

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-242.0.0-linux-x86_64.tar.gz

tar zxvf google-cloud-sdk-242.0.0-linux-x86_64.tar.gz

./google-cloud-sdk/install.sh

source ~/.zshrc

# SETUP
gcloud init

# GET APPLICATION DEFAULT FOR RUNNING LOCALLY AND TALKING TO THE CLOUD
gcloud auth application-default login

# CONFIGURE GCLOUD CONTAINER REGISTRY
gcloud auth configure-docker
