FROM java:8

# embulk
RUN wget -q https://dl.embulk.org/embulk-latest.jar -O /bin/embulk \
  && chmod +x /bin/embulk

WORKDIR /root

# ENTRYPOINT ["java", "-jar", "/bin/embulk"]