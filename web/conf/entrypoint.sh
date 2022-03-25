#!/bin/bash

# 証明書の有効期間(10年)
DAYS=3650

# サーバのホスト名
SSL_HOST_NAME="localhost"

# サーバ証明書，鍵の配置場所
SSL_PKI_DIR="/etc/pki/ssl"

# Subjectの情報
SERVER_SUBJECT="/C=JP/ST=Nagasaki/L=Nagasaki-shi/O=NT Dentsu/CN=${SSL_HOST_NAME}"

mkdir -p ${SSL_PKI_DIR}

# 秘密鍵の生成
openssl genrsa -out ${SSL_PKI_DIR}/server.key 2048

# CSR(Certificate Signing Request)の生成
openssl req -new -key ${SSL_PKI_DIR}/server.key -out ${SSL_PKI_DIR}/server.csr -subj "${SERVER_SUBJECT}"

# オレオレ証明書に署名
openssl x509 -in ${SSL_PKI_DIR}/server.csr -days ${DAYS} -req -signkey ${SSL_PKI_DIR}/server.key -out ${SSL_PKI_DIR}/server.crt