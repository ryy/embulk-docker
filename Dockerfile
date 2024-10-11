FROM openjdk:8

RUN wget -q https://dl.embulk.org/embulk-0.9.25.jar -O /bin/embulk \
  && chmod +x /bin/embulk

WORKDIR /root
