#!/bin/sh

sudo docker run -i -v $(which aws-lambda-rie):/usr/local/bin/aws-lambda-rie -p 9000:8080 muskit/aws-puppeteer-test