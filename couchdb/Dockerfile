#
# docker build --force-rm=true -t visualjeff/couchdb-ssl:latest .
# docker run -d -p 6984:6984 visualjeff/couchdb-ssl:latest

FROM klaemo/couchdb-ssl

# All outside addresses to access couchdb.  Might not need to set this because nginx is fronting couchdb.
# RUN sed -e 's/^bind_address = .*$/bind_address = 0.0.0.0/' -i /etc/couchdb/default.ini;
# RUN sed -e 's/enable_cors = false$/enable_cors = true/' -i /etc/couchdb/default.ini;

# Create the guest mount for external couchdb data storage and configs.
#VOLUME ["/usr/local/var/lib/couchdb"]

COPY ./conf/local.ini /usr/local/etc/couchdb/
#COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/server.crt /etc/nginx/certs/
COPY ./conf/server.key /etc/nginx/certs/
COPY ./conf/dhparams.pem /etc/nginx/certs/
COPY ./conf/chain.pem /etc/nginx/certs/
