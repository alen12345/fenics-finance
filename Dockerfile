FROM quay.io/fenicsproject/dev:latest
USER root

ENV FENICS_PYTHON=python3
WORKDIR /tmp
RUN /bin/bash -c "PIP_NO_CACHE_DIR=off ${FENICS_PYTHON} -m pip install pandas seaborn bokeh statsmodels tensorflow scikit-learn theano zipline pyfolio quandl"

ENV FENICS_PYTHON=python2
WORKDIR /tmp
RUN /bin/bash -c "PIP_NO_CACHE_DIR=off ${FENICS_PYTHON} -m pip install pandas seaborn bokeh statsmodels tensorflow scikit-learn theano zipline pyfolio quandl"

RUN apt-get -qq update && \
    apt-get -y upgrade && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
