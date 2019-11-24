FROM python:3.6.1-alpine
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN apk add --no-cache mariadb-dev g++ && \
    pip install --no-cache-dir -r /tmp/requirements.txt && \
    apk del g++ mariadb-dev && \
    apk add --no-cache mariadb-client-libs


CMD ["/bin/sh"]
