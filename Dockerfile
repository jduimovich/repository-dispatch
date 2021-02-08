FROM registry.access.redhat.com/ubi8/ubi
WORKDIR /action
COPY . . 

CMD [ "/bin/sh", "signal_repo" ]

