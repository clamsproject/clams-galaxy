FROM bgruening/galaxy-stable:20.05

RUN apt-get update || apt-get install -y vim-nox
WORKDIR /galaxy-central

COPY config config/
COPY static static/
COPY tool-data tool-data/
COPY tools tools/
COPY display_applications display_applications/

