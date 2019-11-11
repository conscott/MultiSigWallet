FROM node:8

RUN apt-get -qq update && \
    apt-get install -y -q --no-install-recommends \
    build-essential \
    ca-certificates \
    libssl-dev \
    libusb-1.0-0 \
    libusb-1.0-0-dev \
    curl \
    wget \
    vim \
    apt-transport-https \
    git \
    python3 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apk/* \
    && apt-get autoremove -y

# Upgrade npm and install global bins
RUN npm install -g --upgrade npm

# Mount app dir and install local packages
WORKDIR /usr/src/app

# Do the npm install
COPY package*.json ./
RUN npm install -g --upgrade npm
RUN npm install -g grunt
RUN npm install
RUN npm audit fix

COPY . .

EXPOSE 5000

ENV DOCKER true

CMD [ "npm", "run", "start"]
