FROM python:3.8-slim

ENV VIDEO_TO_PROCESS="https://my.file.to.download.com/filename.mp4"

# install deps
RUN apt-get update && apt-get -y install \
    bash ffmpeg wget curl

# setup RIFE
WORKDIR /rife
COPY . .
# move to installation inside
# RUN pip3 install -r requirements.txt

ADD docker/inference_img /usr/local/bin/inference_img
RUN chmod +x /usr/local/bin/inference_img
ADD docker/inference_video /usr/local/bin/inference_video
RUN chmod +x /usr/local/bin/inference_video

ARG SCRIPT_FOLDER="/rife/scripts"
ADD docker/scripts/main.sh $SCRIPT_FOLDER/main.sh
RUN chmod +x $SCRIPT_FOLDER/main.sh
ADD docker/scripts/install-pip-req.sh $SCRIPT_FOLDER/install-pip-req.sh
RUN chmod +x $SCRIPT_FOLDER/install-pip-req.sh
ADD requirements.txt $SCRIPT_FOLDER/requirements.txt

# add pre-trained models (for testing, will be done in a script)
# ADD /mnt/f/Repos/ECCV2022-RIFE-CLOUD/vimeo/vimeo_triplet /rife/train_log

WORKDIR /host
ENTRYPOINT ["/bin/bash"]

ENV NVIDIA_DRIVER_CAPABILITIES all