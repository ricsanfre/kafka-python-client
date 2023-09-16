############################################################################
# Alpine-based docker container with:
#  * Python3
#  * librdkafka (fully featured)
#  * kafkacat (withouth schema-registry/Avro support)
#  * confluent-kafka-python
#
#############################################################################

FROM python:slim
RUN apt-get update -qq && \
    apt-get install sudo git apt-utils python3-pip -y && \
    apt-get clean && \
    rm -rf /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/* /tmp/* /var/tmp/*


ADD src /kafka-client
WORKDIR /kafka-client

# Upgrade setuptools
RUN pip3 install --upgrade pip setuptools

# Install basic python dependencies
RUN pip3 install -r requirements.txt

