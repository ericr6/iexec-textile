FROM ubuntu:latest

# Get the TLS CA certificates, they're not provided by busybox.
RUN apt-get update && apt-get install -y ca-certificates wget bash\
      && mkdir /target \
        && cd /target \
	  && wget https://github.com/textileio/textile/releases/download/v0.0.2/textile_v0.0.2_linux-amd64.tar.gz \
	    && tar -xvf textile_v0.0.2_linux-amd64.tar.gz

# Now comes the actual target image, which aims to be as small as possible.
FROM busybox:1.31.0-glibc
LABEL maintainer="Textile <contact@textile.io>"

# Get the textile binary, entrypoint script, and TLS CAs from the build container.
ENV SRC_DIR /textile
COPY --from=0 /target/textile /usr/local/bin/textile
COPY --from=0 /etc/ssl/certs /etc/ssl/certs

COPY entrypoint.sh /entrypoint.sh
RUN mkdir .textile
COPY config.yml config.yml
RUN cp config.yml .textile/config.yml
RUN mkdir ~/.textile
COPY auth.yml auth.yml
RUN cp auth.yml ~/.textile/auth.yml
RUN chmod +x /entrypoint.sh


ENTRYPOINT ["./entrypoint.sh"]

