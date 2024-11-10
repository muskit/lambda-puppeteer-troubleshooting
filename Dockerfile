FROM shivjm/node-chromium:node18-chromium110-alpine

ARG FUNCTION_DIR=/app
WORKDIR ${FUNCTION_DIR}
ENV NODE_ENV=production

# puppeteer vars for node-chromium alpine
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1

# chromium dependencies -- prob not necessary for this image
RUN apk add --no-cache \
    udev \
    ttf-freefont \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    fontconfig \
    curl

# for aws-lambda-ric
RUN apk add --no-cache --update --repository=https://dl-cdn.alpinelinux.org/alpine/v3.16/main/ libexecinfo-dev
RUN apk add --no-cache \
    libstdc++ \
    build-base \
    libtool \
    autoconf \
    automake \
    cmake \
    libcurl \
    g++ \
    make \
    unzip \
    curl-dev \
    python3
RUN npm i aws-lambda-ric

COPY package*.json ./
RUN npm ci

COPY src ./src
COPY bootstrap ./

### AWS DEPLOYMENT ###
# Required for Node runtimes which use npm@8.6.0+ because
# by default npm writes logs under /home/.npm and Lambda fs is read-only
ENV NPM_CONFIG_CACHE=/tmp/.npm

# Set runtime interface client as default command for the container runtime
EXPOSE 8080
ENTRYPOINT ["./bootstrap"]

# Pass the name of the function handler as an argument to the runtime
CMD ["lambda.handler"]