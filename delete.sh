#!/bin/bash

set -euo pipefail

# delete.sh が配置されているディレクトリをカレントディレクトリとする
cd `dirname $0`

function error_handler() {
  set +x
  echo "something went wrong" >&2
  exit 1
}

echo "start"
trap error_handler ERR
set -x

# データベースのデータを削除
sudo rm -rf ./db/db-data/*

# sessionデータを削除
sudo rm -rf ./web/phpsession/*

# webコンテンツを削除
sudo rm -rf ./web/html/*

set +x
echo "successful"
