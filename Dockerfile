FROM alpine:3.5 as init_scripts

WORKDIR /unzip
ENTRYPOINT ["unzip"]
RUN apk add -U unzip && rm -rf /var/cache/apk/*
COPY ./portal/db2_tarasenko_dump.zip .
RUN unzip db2_tarasenko_dump.zip

FROM ibmcom/db2

COPY --from=init_scripts /unzip /backup
RUN mkdir /var/custom
RUN sed 's/^M$//' createschema.sh > createschema.sh
COPY ./createschema.sh /var/custom
RUN chmod a+x /var/custom/createschema.sh