#!/bin/sh

cd "$(dirname "$(realpath "$0")")";

source /rife/docker/scripts/install-pip-req.sh

source /rife/docker/scripts/download_pre_trained.sh