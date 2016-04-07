#!/bin/sh

DIR=/etc/acme/{{ site_name }}

python $DIR/acme_tiny.py --account-key $DIR/account.key --csr $DIR/domain.csr --acme-dir $DIR/challenges > $DIR/signed.crt || exit 1

wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > $DIR/intermediate.pem

cat $DIR/signed.crt $DIR/intermediate.pem > $DIR/chained.pem

service nginx reload
