FROM ruby:2.3.1

# install
#RUN gem install pingdom-to-graphite

# install from altered sources
RUN cd /opt \
  && git clone https://github.com/monotek/pingdom-to-graphite.git -b fixmetricname \
  && cd pingdom-to-graphite \
  && bundle install

# create entrypoint
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# docker init
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["pingdom-to-graphite"]
