# FROM jupyter/base-notebook
FROM continuumio/miniconda3
LABEL maintainer="TachibanaET <https://github.com/TachibanaET>"
# Install dependencies
ARG PROXY
ENV HTTP_PROXY ${PROXY}
ENV HTTPS_PROXY ${PROXY}
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ Asia/Tokyo

RUN apt update && apt -y upgrade
RUN apt -y install vim \
    wget \
    curl \
    git \
    gcc \
    cmake \
    unzip \
    tmux \
    sudo \
    tzdata

# Create user & add to sudoers
ARG UID
ARG GID
ARG UNAME
ARG OSTYPE

# Only For Linux
RUN bash -c 'if [ ${OSTYPE} == Linux ]; then groupadd -g ${GID} ${UNAME}; fi' && \
    useradd -u ${UID} -g ${UNAME} -G sudo  -m ${UNAME} && \
    echo "${UNAME}:${UNAME}" | chpasswd && \
    echo "${UNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV UID ${UID}
ENV GID ${GID}
ENV UNAME ${UNAME}

# Change Permission
COPY ./set_volume_permission.sh /home/${UNAME}/
RUN chmod +x /home/${UNAME}/set_volume_permission.sh && \
    /home/${UNAME}/set_volume_permission.sh

# Install libraries
COPY ./source/requirements.txt /home/${UNAME}/
RUN pip install -r /home/${UNAME}/requirements.txt