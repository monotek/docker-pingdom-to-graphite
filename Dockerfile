FROM ruby:2.3.1

# install
gem install pingdom-to-graphite

# create entrypoint
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# docker init
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["pingdom-to-graphite"]
