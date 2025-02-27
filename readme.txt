# --- *** Expo React JS Develop Environment with Docker in Linux Mint 21. *** --- #

--- youtube ---
https://youtu.be/TMk8Pf1-1n0

--- github repository ---
https://github.com/ggvhcs/node-react-js

Develop Enviroment:
---
Linux Mint 21.2 Mate x64.
Docker version 24.0.7, build 24.0.7-0ubuntu2~22.04.1
git version 2.34.1
Github Desktop version 3.2.0-linux1 (x64)
Visual Studio Code version 1.96.4
---

1 --- download image node:18.16.0-buster from hub docker ---
$ sudo docker pull node:18.16.0-buster
$ sudo docker images |grep node

$ cd ~/Documents/GitHub/docker/node/node-react-js
$ ls -l
---
 255 Feb 25 16:48 Dockerfile
5477 Feb 25 17:09 readme.txt
---

$ sudo chmod 777 -Rvf ../node-react-js
$ sudo chown nobody:nogroup -Rvf ../node-react-js

2 --- Create the Dockerfile file --- #
$ touch Dockerfile
$ nano Dockerfile
$ cat Dockerfile
---
FROM node:18.16.0-buster

RUN npm i -g react@latest

RUN npm i -g create-react-app

WORKDIR /app

CMD ["/bin/bash"]

---

3 --- create image from debian latest ---
$ sudo docker build -t node-reactjs .
$ sudo docker images |grep node-reactjs
---
$ sudo docker images |grep node-reactjs
node-reactjs        latest           72d67fdde387   About an hour ago   1.59GB
---

4 --- create an network bridge ---
$ sudo docker network create --subnet=172.15.0.0/16 homenet
$ sudo docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
5d945100191c   homenet   bridge    local

5 --- create an container for test ---
$ cd ~/Documents/GitHub/docker/node/node-react-js

$ docker run -d -it -p [host_port]:[container_port] –name [container_name] [image_id/image_tag]

$ sudo docker run -ti --name noderjsd \
--net homenet --ip 172.15.0.15 -dp 3000:3000 \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash node-reactjs

$ node --version
---
v18.16.0
---
$ npm --version
---
9.5.1
---
$ yarn --version
---
1.22.19
---
$ npx --version
---
9.5.1
---
$ create-react-app --version
---
0.22.18
---

6 ---  ---
$ ls -l /app
$ npx create-react-app noderjsd
$ cd noderjsd
$ yarn start
---
---

8 --- open the app with web browser ---
