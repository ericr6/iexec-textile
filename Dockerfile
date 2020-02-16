FROM nvidia/cuda
#inspired by https://github.com/yuyou/blender/blob/master/7.5/Dockerfile
MAINTAINER eric <er@iex.ec>

ENV BLENDER_MAJOR 2.79
ENV BLENDER_VERSION 2.79b
ENV BLENDER_BZ2_URL http://mirror.cs.umn.edu/blender.org/release/Blender$BLENDER_MAJOR/blender-$BLENDER_VERSION-linux-glibc219-x86_64.tar.bz2 

RUN apt-get update && \
	apt-get install -y \
		curl wget nano unzip\
		bzip2 libfreetype6 libgl1-mesa-dev \
		libglu1-mesa \
		libxi6 \
		libxrender1 && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*



RUN mkdir /usr/local/blender && \
	curl -SL "$BLENDER_BZ2_URL" -o blender.tar.bz2 && \
	tar -jxvf blender.tar.bz2 -C /usr/local/blender --strip-components=1 && \
	rm blender.tar.bz2

RUN ln -s /usr/local/blender/blender /usr/bin/blender

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

RUN mkdir .textile
COPY config.yml config.yml
RUN cp config.yml .textile/config.yml
RUN mkdir ~/.textile
COPY auth.yml auth.yml
RUN cp auth.yml ~/.textile/auth.yml

COPY gpurender.py /gpurender.py
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]   
