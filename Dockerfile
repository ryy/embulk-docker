FROM openjdk:8

RUN wget -q https://dl.embulk.org/embulk-0.9.25.jar -O /bin/embulk \
  && chmod +x /bin/embulk

WORKDIR /root

COPY ./embulk_bundle/Gemfile /root/embulk_bundle/Gemfile
COPY ./embulk_bundle/Gemfile.lock /root/embulk_bundle/Gemfile.lock

RUN cd embulk_bundle/ && embulk bundle

COPY . /root