#!/bin/bash

set -euo pipefail

# source_dirとdestination_dirに値を設定してください

# dentsuToolディレクトリがあるところまでのパス(dentsuTool/は含まなくていい)
source_dir=""
# lampディレクトリがあるところまでのパス(lamp/は含まなくていい)
destination_dir=""

# dentsuTools/からuser_icon/までのパス
usericon_dir="index/content/user_icon/"

function error_handler() {
  set +x
  echo "something went wrong" >&2
  exit 1
}

echo "start"
trap error_handler ERR
set -x

# セッションファイルの保存先ディレクトリをwww-dataが書き込めるように権限変更
eval "chmod o+rwx ${destination_dir}lamp_docker/web/phpsession/"
# indexディレクトリ以下をlamp/web/html/にコピー
eval "cp -r ${source_dir}dentsuTools/index/ ${destination_dir}lamp_docker/web/html/"
# アイコンの保存先ディレクトリにwww-dataがファイルを作成できるように権限変更
eval "chmod o+rwx ${destination_dir}lamp_docker/web/html/${usericon_dir}"

# dbaccess.php中にあるデータベースのホスト名をlocalhostからdbに変更
before_host="const HOST_NAME = 'localhost'"
after_host="const HOST_NAME = 'db'"
eval "sed -i -e \"s/${before_host}/${after_host}/\" ${destination_dir}lamp_docker/web/html/index/common/dbaccess.php"
set +x
echo "successful"