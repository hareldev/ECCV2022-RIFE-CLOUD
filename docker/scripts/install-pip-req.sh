#!/bin/sh

cd "$(dirname "$(realpath "$0")")";

echo "Starting pip3 installations..."
pip3 install -r ../../requirements.txt