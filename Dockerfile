FROM postgres:14.1

WORKDIR /database_sample/

RUN apt-get --yes update && \
    apt-get --yes install gcc libdbi-perl libdbd-pg-perl libpq-dev build-essential autoconf automake libtool gdb && \
    rm -rf /var/lib/apt/lists/*

COPY docker/sample.sh ./sample.sh

COPY docker/pg_sample ./pg_sample

RUN chmod +x ./pg_sample

RUN chmod +x ./sample.sh

CMD ["./sample.sh"]
