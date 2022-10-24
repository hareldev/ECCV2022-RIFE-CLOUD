Demo file download:

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1i3xlKb7ax7Y70khcTcuePi6E7crO_dFc' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1i3xlKb7ax7Y70khcTcuePi6E7crO_dFc" -O /tmp/video.mp4 && rm -rf /tmp/cookies.txt

## Build image
```
docker build . --tag=video-test:v0.1 -f docker/Dockerfile
```

## Run tests with cache folder for pip:
```
docker run -d --gpus all -v "/tmp/cache/pip:/root/.cache/pip" --entrypoint "/bin/bash" video-test:v0.1 -c 'while true; do echo sleeping; sleep 999; done'
```

## Exec to the container:
```
docker exec -it $(docker ps -a -q --filter "ancestor=video-test:v0.1" --filter "status=running") /bin/bash
```

## Run scripts:
```
/rife/docker/scripts/main.sh
```

## Test video can be downloaded:
```
test_video_id="1i3xlKb7ax7Y70khcTcuePi6E7crO_dFc"
test_video_location="/tmp"
test_video_filename="video.mp4"
mkdir -p $test_video_location
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$test_video_id" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$test_video_id" -O "$test_video_location/$test_video_filename" && rm -rf /tmp/cookies.txt
```

## Run interpolation:
```
cd /rife && time python3 inference_video.py --exp=1 --video=/tmp/video.mp4 --output=/tmp/video_X2.mp4
```

