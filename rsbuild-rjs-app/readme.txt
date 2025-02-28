!!!Just like the last video, everything is the same. !menos los ultimos pasos ok.

--- bibliography: ---
https://rsbuild.dev/guide/framework/react

# --- *** React JS Develop Environment with create rsbuild@latest from Docker in Linux Mint 21. *** --- #

--- youtube ---

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

1 --- download image node:18.16.0 from hub docker ---
$ sudo docker pull node:18.16.0 // command docker for download image from hub docker !if not down before.
$ sudo docker images |grep node // list the image downloaded.

$ cd ~/Documents/GitHub/docker/node/node-react-js/rsbuild-rjs-app
$ ls -l
---
-rwxrwxrwx  1 nobody nogroup   129 Feb 27 18:40 Dockerfile
drwxrwxrwx 21 nobody nogroup  4096 Feb 27 18:15 node_modules
-rwxrwxrwx  1 nobody nogroup   379 Feb 27 17:54 package.json
-rwxrwxrwx  1 nobody nogroup 15814 Feb 27 18:15 package-lock.json
drwxrwxrwx  2 nobody nogroup  4096 Feb 27 17:54 public
-rwxrwxrwx  1 nobody nogroup   262 Feb 27 17:54 README.md
-rwxrwxrwx  1 nobody nogroup  3281 Feb 28 04:54 readme.txt
-rwxrwxrwx  1 nobody nogroup   162 Feb 27 17:54 rsbuild.config.ts
drwxrwxrwx  2 nobody nogroup  4096 Feb 27 17:54 src
---

$ sudo chmod 777 -Rvf ../rsbuild-rjs-app // we need be sure, all privileges for docker in this folder.
$ sudo chown nobody:nogroup -Rvf ../rsbuild-rjs-app

2 --- Create the Dockerfile file --- 
$ touch Dockerfile // create the file, if not exist.
$ nano Dockerfile // for edit the file.
$ cat Dockerfile // see the content.
---
FROM node:18.16.0-buster

RUN npm i -g react@latest

RUN npm i -g create-react-app

WORKDIR /app

EXPOSE 3000

CMD ["/bin/bash"]
---

3 --- create image from debian latest ---
$ sudo docker build -t node-reactjs . // create the image docker.
$ sudo docker images |grep node-reactjs // list the image created.
---
node-reactjs       latest           df2fda52c41a   2 hours ago     975MB
---

4 --- create an network bridge ---
$ sudo docker network create --subnet=172.15.0.0/16 homenet // create the net if not exist. <---
$ sudo docker network ls // list all docker nets.
NETWORK ID     NAME      DRIVER    SCOPE
5d945100191c   homenet   bridge    local

5 --- create an container for test ---
$ cd ~/Documents/GitHub/docker/node/node-react-js // we need be in the correct directory.

--- ---
$ sudo docker run -ti --name noderjsd \
--net homenet --ip 172.15.0.15 -dp 3000:3000 \
-v $(pwd):/app \
--interactive --tty --entrypoint /bin/bash node-reactjs

# --name --> name of container.
# --net homenet --ip 172.15.0.15 --> set static ip address.
# -v $(pwd):/app --> $(pwd)current hosts folder will be mounted as project folder in docker container.

--- after that check if contaner is running. ---
$ sudo docker ps // list if the container is created and if it is running.

--- we need be enside the container. ---
$ sudo docker exec -it cc17ed0e9a78 bash

--- run this commands for check if you want.
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

6 --- I will create another rsbuild react app for test ---

$ mkdir rsbuild-rjs-default
$ cd rsbuild-rjs-default/
$ npm create rsbuild@latest
$ cd rsbuild-app-default
$ npm install
$ npm fund
$ rm package-lock.json // if you need, delete the file.
$ npm install
$ npm fund
$ chown nobody:nogroup -Rvf ../rsbuild-app-default
$ chmod 777 -Rvf ../rsbuild-app-default
$ mv rsbuild.config.mjs rsbuild.config.ts // *** !importante... ***

--- run the app reactjs. ---
$ npm run dev

8 --- open the app with web browser ---
