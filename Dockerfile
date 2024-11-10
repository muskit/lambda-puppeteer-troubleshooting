FROM node:18-buster

ARG FUNCTION_DIR=/app
WORKDIR ${FUNCTION_DIR}
ENV NODE_ENV=production

# ensure packages are up to date
RUN apt-get update && apt-get upgrade -y

# for aws-lambda-ric
RUN apt-get install -y \
    g++ \
    make \
    cmake \
    unzip \
    libcurl4-openssl-dev
RUN npm i aws-lambda-ric

# chromium
RUN apt-get install chromium -y

COPY package*.json ./
RUN npm ci

### AWS DEPLOYMENT ###
# Required for Node runtimes which use npm@8.6.0+ because
# by default npm writes logs under /home/.npm and Lambda fs is read-only
ENV NPM_CONFIG_CACHE=/tmp/.npm

EXPOSE 8080

COPY bootstrap ./
COPY src ./src

# Set runtime interface client as default command for the container runtime
ENTRYPOINT ["./bootstrap"]

# Pass the name of the function handler as an argument to the runtime
CMD ["lambda.handler"]