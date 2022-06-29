FROM python:alpine3.16

RUN pip install trcli junitparser

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
