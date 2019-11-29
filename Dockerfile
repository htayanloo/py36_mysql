FROM python:3.6.1-alpine
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN apk add --no-cache mariadb-dev g++ && \
    apk del g++ mariadb-dev && \
    apk add --no-cache mariadb-client-libs
RUN apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .build-deps build-base linux-headers &&\
    pip install --no-cache-dir -r /tmp/requirements.txt && \
    apk del .build-deps

CMD ["/bin/sh"]
