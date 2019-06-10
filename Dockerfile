# using https://github.com/materialscloud-org/mc-docker-stack/tree/discover
#
FROM aiidalab/aiidalab-docker-stack:discover
USER root
WORKDIR /project


# Install jsmol
RUN wget https://sourceforge.net/projects/jmol/files/Jmol/Version%2014.29/Jmol%2014.29.22/Jmol-14.29.22-binary.zip/download --output-document jmol.zip
RUN unzip jmol.zip && cd jmol-14.29.22 && unzip jsmol.zip

# Install nodejs
RUN apt-get update && apt-get install -y --no-install-recommends nodejs

# Copy bokeh app
WORKDIR /project/discover-mofs
COPY figure ./figure
COPY figure_top ./figure_top
COPY select-figure ./select-figure
COPY detail ./detail
RUN ln -s /project/jmol-14.29.22/jsmol ./detail/static/jsmol
COPY setup.py import_db.py ./
RUN pip install -e .
COPY serve-app.sh /opt/

RUN chown -R scientist:scientist /project

USER scientist

# This environment variable can be changed at build time:
#   docker build  --build-arg BOKEH_PREFIX=/abc
ARG BOKEH_PREFIX="abc"
ENV BOKEH_PREFIX $BOKEH_PREFIX

# start bokeh server
EXPOSE 5006
CMD ["/opt/serve-app.sh"]

#EOF
