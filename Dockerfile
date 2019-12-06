FROM bgruening/galaxy-stable:19.05

WORKDIR /galaxy-central

COPY config config/
COPY static static/
COPY tool-data tool-data/
COPY tools tools/
COPY display_applications display_applications/

