FROM rocker/r-base:latest

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/phdax/docker-rserve" \
      org.label-schema.vendor="" \
      maintainer="phdax <pophitdax@gmail.com>"

RUN Rscript -e "install.packages('Rserve',repos='https://cran.ism.ac.jp/')" \
&& Rscript -e '.libPaths("./opt/r/lib")' \
&& mkdir -p /opt/r/work

COPY /conf/Rserv.conf /opt/r/
COPY /conf/user.txt /opt/r/

ENV R_LIBS="/opt/r/lib"

EXPOSE 6312

ENTRYPOINT R CMD Rserve --no-save --RS-conf /opt/r/Rserv.conf && tail -f /dev/null