# lamp_docker
dentsuToolsのdocker上の検証環境です。

## ディレクトリ構成の説明
- copy.sh
  - 変更した別ディレクトリのdentsuToolsディレクトリをlamp_dockerディレクトリ下に配置し、また権限の変更を行うためのシェルスクリプト
- docker-compose.yml
  - dbコンテナとwebコンテナの設定を行うファイル
- db/
  - dbコンテナ(mysql)用のディレクトリ
  - db-data/
    - ホスト側とコンテナ側で共有するデータベース情報を格納するディレクトリ
  - initdb.d
    - dbコンテナを初めて起動したときに実行されるファイル群を格納するディレクトリ
    - この中のsqlファイルによって初期のデータベースやテーブルが作成される
  - my.cnf
    - 文字関連の設定
- web/
  - webコンテナ(apache+php)用のディレクトリ
  - Dockerfile
    - apache+phpイメージにpdo-mysqlなどのライブラリを導入するためのファイル
  - html/
    - dentsuToolsのindexディレクトリをホストとコンテナで共有するためのディレクトリ
  - phpsession/
    - セッションファイルをホストとコンテナで共有するためのディレクトリ
  - php.ini
    - php関連の設定

## 環境
- webコンテナ
  - php:7.4-apache
- dbコンテナ
  - mysql:5.7.34

## 使い方
前提：dockerの環境を導入していること
1. copy.shの編集
   - copy.shの`source_dir`と`destination_dir`をコメントに書かれてあることに従って追記する
2. コンテナの作成
   - docker-compose.ymlがある場所で`docker-compose up --build -d`を入力
   - ２回目以降は、`docker-compose up -d`で良い
   - `localhost:80`でアクセス
     - もしポートを変更したい場合は`docker-compose.yml`のポート部分を書き換えることで変更可
3. コンテナの停止&削除
   - `docker-compose down`を入力

docker関連のコマンドは、Webサイトや
https://scrapbox.io/NagasakiTech-InfHub/docker%E3%82%88%E3%81%8F%E4%BD%BF%E3%81%86%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89
などを参考にしてください。
