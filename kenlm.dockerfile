FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC
RUN apt update && apt install -y build-essential cmake curl libboost-system-dev libboost-thread-dev libboost-program-options-dev libboost-test-dev libeigen3-dev zlib1g-dev libbz2-dev liblzma-dev && rm -rf /var/lib/apt/lists/*
WORKDIR /
RUN sh -c 'curl https://kheafield.com/code/kenlm.tar.gz | tar xz'
RUN mkdir /kenlm/build && cd /kenlm/build && cmake .. && make -j2
CMD /kenlm/build/bin/lmplz -o 5

