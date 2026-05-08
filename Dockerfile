FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        python3 \
        python3-pip \
        gcc \
        sudo \
        vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --shell /bin/bash debugroot && \
    useradd --create-home --shell /bin/bash debuguser && \
    echo "debugroot ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/debugroot && \
    chmod 0440 /etc/sudoers.d/debugroot

USER debugroot

WORKDIR /home/debugroot
