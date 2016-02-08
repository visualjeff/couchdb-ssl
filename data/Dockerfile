# To build: docker build --force-rm=true -t visualjeff/data:0.0.1 .
# To run: docker run -d --name data_container -t visualjeff/data:0.0.1

FROM busybox:latest
RUN mkdir -p /usr/local/var/lib/couchdb
VOLUME /usr/local/var/lib/couchdb

CMD ["echo", "Data container for couchdb"]
