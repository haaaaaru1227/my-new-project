# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.1.0
FROM ruby:$RUBY_VERSION-slim AS base

ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

WORKDIR /rails

# Install dependencies
RUN apt-get update -qq && apt-get install --no-install-recommends -y \
    curl \
    libjemalloc2 \
    libvips \
    libv8-dev \
    build-essential \
    libssl-dev \
    libmariadb-dev \
    libpq-dev \
    python3 \
    g++ \
    clang \
    zlib1g-dev \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 2.5.22

# Install Node.js and Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install --no-install-recommends -y nodejs && \
    npm install -g yarn && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV RAILS_ENV=production \
    NODE_ENV=production \
    SECRET_KEY_BASE=dummy_secret_key_base \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=development

# Build stage
FROM base AS build

# Copy application dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

COPY package.json yarn.lock ./
RUN yarn install --check-files

# Copy application code
COPY . .

# Install Webpacker
RUN SECRET_KEY_BASE=dummy_secret_key_base bin/rails webpacker:compile


RUN bundle exec bootsnap precompile app/ lib/ && \
    bin/rails assets:precompile
# Precompile assets
RUN SECRET_KEY_BASE=dummy_secret_key_base bundle exec bootsnap precompile app/ lib/ && \
    SECRET_KEY_BASE=dummy_secret_key_base bin/rails assets:precompile

# Final stage
FROM base

# Copy built artifacts
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER 1000:1000

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
