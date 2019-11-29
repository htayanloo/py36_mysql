FROM python:3.6.1-alpine
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN apk add --no-cache jpeg-dev zlib-dev && \
    apk add --no-cache mariadb-dev g++ && \
    apk add --no-cache --virtual .build-deps build-base linux-headers && \
    pip install --no-cache-dir -r /tmp/requirements.txt && \
    apk del g++ mariadb-dev && \
    apk del .build-deps && \
    apk add --no-cache mariadb-client-libs


CMD ["/bin/sh"]