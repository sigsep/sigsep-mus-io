FROM jrottenberg/ffmpeg:3.4

# install mp4box v.0.7.1
RUN apt-get update && \
    apt-get install -y git gcc make build-essential && \
    git clone https://github.com/gpac/gpac.git && \
    cd gpac && \
    git checkout v0.7.1 && \
    ./configure --static-mp4box --use-zlib=no && \
    make -j4 && \
    make install

COPY ./scripts/ /scripts/

ENTRYPOINT ["/bin/bash"]
