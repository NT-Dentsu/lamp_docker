FROM php:7.4-apache
# php7.4からmbstringでに変わりlibonig-devをインストール
# PDOドライバがsqliteしか対応していないので追加でmysqlのドライバをダウンロード(標準拡張モジュール)
# aptキャッシュの削除
RUN apt-get update && apt-get install -y libonig-dev \
 && docker-php-ext-install pdo pdo_mysql \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
# 80番ポートの開放
EXPOSE 80