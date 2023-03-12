FROM bgruening/galaxy-stable:20.05

# https://github.com/yarnpkg/yarn/issues/7866
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt-get update && apt-get install -y vim-nox
WORKDIR /galaxy-central

COPY config config/
COPY static static/
COPY tool-data tool-data/
COPY tools tools/
COPY display_applications display_applications/

RUN $GALAXY_CONDA_PREFIX/bin/pip install clams-python

