FROM node:14.21.3-slim
RUN apt-get update && apt-get install wget -y && apt-get install mosquitto -y

# Create app directory
WORKDIR /usr/src/meta

RUN mkdir -p active
RUN mkdir -p library
RUN wget https://raw.githubusercontent.com/jac459/meta/Release/settings.js -O settings.js
RUN wget https://raw.githubusercontent.com/jac459/meta/Release/update.sh -O update.sh
RUN chmod +x update.sh && ./update.sh && rm update.sh

EXPOSE 4016
CMD [ "node", "meta.js" ]
