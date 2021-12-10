FROM postgres:14.1

WORKDIR /database_sample/
COPY docker/MyConfig.pm /.cpan/CPAN/MyConfig.pm
RUN apt-get --yes update && \
    apt-get --yes install gcc libdbi-perl libpq-dev build-essential autoconf automake libtool gdb && \
    rm -rf /var/lib/apt/lists/*
RUN cpan App::cpanminus
RUN cpanm --notest DBD::Pg

COPY docker/pg_sample ./pg_sample
COPY docker/sample.sh ./sample.sh

RUN chmod +x ./pg_sample
RUN chmod +x ./sample.sh

CMD ["./sample.sh"]
