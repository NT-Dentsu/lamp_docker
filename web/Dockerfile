FROM php:7.4-apache
# php7.4からmbstringでに変わりlibonig-devをインストール
# PDOドライバがsqliteしか対応していないので追加でmysqlのドライバをダウンロード(標準拡張モジュール)
# aptキャッシュの削除
RUN apt-get update && apt-get install -y libonig-dev \
 && docker-php-ext-install pdo pdo_mysql \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Apacheのバージョンを隠蔽(ここに書くのはあまり良くない気がする)
RUN echo "ServerTokens ProductOnly" >> /etc/apache2/apache2.conf

COPY conf/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
COPY conf/entrypoint.sh /tmp/
RUN chmod a+x /tmp/entrypoint.sh
RUN /bin/bash -c "source /tmp/entrypoint.sh"
RUN a2enmod ssl
RUN a2ensite default-ssl
# 443番ポートの開放
EXPOSE 443
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]