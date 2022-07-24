FROM jupyter/base-notebook
LABEL maintainer="TachibanaET <https://github.com/TachibanaET>"

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
RUN chmod +x /home/${UNAME}/set_volume_permission.sh

RUN /home/${UNAME}/set_volume_permission.sh