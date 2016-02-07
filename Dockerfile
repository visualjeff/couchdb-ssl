#
# docker build --force-rm=true -t visualjeff/couchdb-ssl:latest .
# docker run -d -p 6984:6984 visualjeff/couchdb-ssl:latest

FROM klaemo/couchdb-ssl

#COPY ./conf/local.ini /usr/local/etc/couchdb/
#COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/server.crt /etc/nginx/certs/
COPY ./conf/server.key /etc/nginx/certs/
COPY ./conf/dhparams.pem /etc/nginx/certs/
COPY ./conf/chain.pem /etc/nginx/certs/
