FROM rocker/r-base:latest

RUN Rscript -e "install.packages('Rserve',repos='https://cran.ism.ac.jp/')" && \
Rscript -e '.libPaths("./opt/r/lib")'

RUN mkdir -p /opt/r/workdir && \
cat <<EOS > /opt/r/user.txt && \
admin admin \
EOS \
cat <<EOS > /opt/r/Rserv.conf \
remote enable \
workdir /opt/r/workdir \
pwdfile /opt/r/user.txt \
auth required \
port 6312 \
EOS

ENV R_LIBS="/opt/r/lib"

EXPOSE 6312

ENTRYPOINT R CMD Rserve --no-save --RS-conf /opt/r/Rserv.conf && tail -f /dev/null