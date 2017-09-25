FROM ruby:2.4.1-slim

# install
RUN git clone git://github.com/lewg/pingdom-to-graphite.git \
    cd pingdom-to-graphite
    bundle install

# create entrypoint
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# docker init
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["pingdom-to-graphite"]


