FROM ubuntu:16.04

ENV HOME /root

RUN apt-get update && \
    apt-get install -y \
      build-essential \
      libpq-dev \
      libssl-dev \
      libreadline6-dev \
      curl \
      git-core \
      libffi-dev && \
    apt-get clean

# Install nvm && Node
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 6.9.1

Run curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash && \
    . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Install rbenv
RUN git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
RUN $HOME/.rbenv/plugins/ruby-build/install.sh
ENV PATH $HOME/.rbenv/bin:$PATH

# Install Ruby
ENV RUBY_VERSION 2.2.5

RUN rbenv install $RUBY_VERSION
RUN rbenv global $RUBY_VERSION
ENV PATH $HOME/.rbenv/shims:$PATH

RUN gem install bundler --no-doc --no-ri
ENV BUNDLE_PATH /bundle

# Setup RailsApp
ENV APP_HOME /var/www
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

EXPOSE 3000
ENTRYPOINT ["./entry_point.sh"]
