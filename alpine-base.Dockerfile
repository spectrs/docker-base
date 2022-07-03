FROM alpine:3.14

SHELL ["/bin/ash", "-c"]

RUN apk update && \
    apk add fish \
        build-base \
        ca-certificates \
        curl \
        htop \
        python3 \
        py3-pip \
        sudo \
        unzip \
        vim \
        wget

# Add a user `coder` so that you're not developing as the `root` user
RUN useradd coder \
    --home=/home/coder \
    --shell=/usr/bin/fish \
    --uid=1000 \
    --user-group && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

USER coder