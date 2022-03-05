#!/bin/bash

set -euo pipefail

# pwd.sh が配置されているディレクトリをカレントディレクトリとする
cd `dirname $0`

function error_handler() {
  set +x
  echo "something went wrong" >&2
  exit 1
}

echo "start"
trap error_handler ERR
set -x

mkdir /root/dentsuTools
git clone https://github.com/NT-Dentsu/dentsuTools.git /root/dentsuTools

sed -i 's/source_dir=\".*\"/source_dir=\"\/root\/\"/' ./copy.sh 

bash copy.sh

docker-compose up --build -d

set +x
echo "successful"