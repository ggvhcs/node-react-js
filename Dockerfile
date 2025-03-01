FROM node:18.16.0-buster

RUN npm i -g react@latest

RUN npm i -g create-react-app

WORKDIR /app

EXPOSE 3000

CMD ["/bin/bash"]
