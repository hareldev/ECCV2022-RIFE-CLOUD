#!/bin/sh

cd "$(dirname "$(realpath "$0")")";

bash /rife/docker/scripts/install-pip-req.sh

bash /rife/docker/scripts/download_pkl_model.sh