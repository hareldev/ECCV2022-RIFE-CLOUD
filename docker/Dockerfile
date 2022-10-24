FROM python:3.8-slim

ENV VIDEO_TO_PROCESS="https://my.file.to.download.com/filename.mp4"

# install deps
RUN apt-get update && apt-get -y install \
    bash ffmpeg wget curl unzip

# setup RIFE
WORKDIR /rife
COPY . .
# move to installation inside
# RUN pip3 install -r requirements.txt

ADD docker/inference_img /usr/local/bin/inference_img
RUN chmod +x /usr/local/bin/inference_img
ADD docker/inference_video /usr/local/bin/inference_video
RUN chmod +x /usr/local/bin/inference_video

ARG SCRIPT_FOLDER="/rife/docker/scripts"
RUN chmod +x $SCRIPT_FOLDER/*

WORKDIR /host
ENTRYPOINT ["/bin/bash"]

ENV NVIDIA_DRIVER_CAPABILITIES all