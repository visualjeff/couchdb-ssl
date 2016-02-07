#
# docker build --force-rm=true -t visualjeff/couchdb-ssl:latest .
# docker run -d -p 5984:5984 -p 6984:6984 visualjeff/couchdb-ssl:latest

FROM klaemo/couchdb-ssl

#COPY local.ini /usr/local/etc/couchdb/
#COPY nginx.conf /etc/nginx/
COPY server.crt /etc/nginx/certs/
COPY server.key /etc/nginx/certs/
COPY dhparams.pem /etc/nginx/certs/
COPY chain.pem /etc/nginx/certs/
