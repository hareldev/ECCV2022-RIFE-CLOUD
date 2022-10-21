Demo file download:

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1i3xlKb7ax7Y70khcTcuePi6E7crO_dFc' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1i3xlKb7ax7Y70khcTcuePi6E7crO_dFc" -O /tmp/video.mp4 && rm -rf /tmp/cookies.txt

