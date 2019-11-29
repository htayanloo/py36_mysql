FROM python:3.6.1-alpine
RUN apk add --no-cache mariadb-dev g++ && \
    apk del g++ mariadb-dev && \
    apk add --no-cache mariadb-client-libs && \
    apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .build-deps build-base linux-headers && apk del .build-deps
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /tmp/requirements.txt

CMD ["/bin/sh"]
