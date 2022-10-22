#!/bin/sh

# pretrained files source:
# https://github.com/hzwer/Practical-RIFE

cd "$(dirname "$(realpath "$0")")";

echo "Starting train_log download..."
train_log_id="1APIzVeI-4ZZCEuIRE1m6WYfSCaOsi_7_"
train_log_location="/rife/train_log"
train_log_filename="RIFE_trained_model_v3.6.zip"
train_log_file_to_extract="flownet.pkl"
mkdir -p $train_log_location
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$train_log_id" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$train_log_id" -O "$train_log_location/$train_log_filename" && rm -rf /tmp/cookies.txt
unzip -qo "$train_log_location/$train_log_filename" -d $train_log_location

# move only this file to train_log:
mv "$train_log_location/train_log/$train_log_file_to_extract" "$train_log_location/$train_log_file_to_extract"
mv "$train_log_location/train_log/*.py" $train_log_location

rm -rf "$train_log_location/$train_log_filename"
rm -rf "$train_log_location/train_log"