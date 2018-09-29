#!/bin/sh

DIR=/etc/acme/{{ site_name }}

python $DIR/acme_tiny.py --account-key $DIR/account.key --csr $DIR/domain.csr --acme-dir $DIR/challenges > $DIR/chained.pem || exit 1

service nginx reload
