FROM ibmcom/db2
RUN yum install unzip -y
COPY ./portal/db2_tarasenko_dump.zip .
RUN unzip db2_tarasenko_dump.zip
COPY . /backup
RUN mkdir /var/custom
RUN sed 's/^M$//' createschema.sh > createschema.sh
COPY ./createschema.sh /var/custom
RUN chmod a+x /var/custom/createschema.sh