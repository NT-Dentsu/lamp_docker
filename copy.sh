#!/bin/bash

set -euo pipefail

# source_dirに値を設定してください

# dentsuToolディレクトリがあるところまでのパス(dentsuTool/は含まなくていい)
source_dir="~/dentsu/"
# copy.sh が配置されているディレクトリをカレントディレクトリとする
cd `dirname $0`

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
eval "chmod o+rwx ./web/phpsession/"
# 古いindexディレクトリを削除
eval "rm -r ./web/html/index/"
# indexディレクトリ以下をlamp/web/html/にコピー
eval "cp -r ${source_dir}dentsuTools/index/ ./web/html/"
# アイコンの保存先ディレクトリにwww-dataがファイルを作成できるように権限変更
eval "chmod o+rwx ./web/html/${usericon_dir}"

# dbaccess.php中にあるデータベースのホスト名をlocalhostからdbに変更
before_host="const HOST_NAME = 'localhost'"
after_host="const HOST_NAME = 'db'"
eval "sed -i -e \"s/${before_host}/${after_host}/\" ./web/html/index/common/php/dbaccess.php"
set +x
echo "successful"
