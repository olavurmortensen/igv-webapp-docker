FROM ubuntu:latest

# Avoid apt-get asking too many questions.
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yqq && \
    apt-get install -yqq \
    git \
    software-properties-common \
    curl \
    wget

# Install Node.js and npm.
# Installation instructions:
# https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update -yqq && \
    apt-get install -yqq nodejs

# Download IGV Web App release from GitHub.
RUN wget --quiet https://github.com/igvteam/igv-webapp/archive/1.3.0.tar.gz
RUN tar xzf 1.3.0.tar.gz

# Build IGV Web App NPM package.
WORKDIR igv-webapp-1.3.0
RUN npm install
RUN npm run build

# Expose port 80.
EXPOSE 80

# Run the app on address 0.0.0.0 and port 80.
ENTRYPOINT ["node_modules/http-server/bin/http-server", "-a", "0.0.0.0", "-p", "80", "dist"]
