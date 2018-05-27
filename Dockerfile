FROM rocker/r-base:latest

RUN Rscript -e "install.packages('Rserve',repos='https://cran.ism.ac.jp/')" && \
Rscript -e '.libPaths("./opt/r/lib")' && \
mkdir -p /opt/r/workdir

COPY /conf/Rserv.conf /opt/r/
COPY /conf/user.txt /opt/r/

ENV R_LIBS="/opt/r/lib"

EXPOSE 6312

ENTRYPOINT R CMD Rserve --no-save --RS-conf /opt/r/Rserv.conf && tail -f /dev/null