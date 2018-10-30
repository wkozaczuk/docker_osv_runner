# Docker OSv runner
Docker container based on Ubuntu 18.10 along with other scripts to demonstrate running various apps on OSv. It builds latest Capstan from master. 

Build container
```
docker build -t osv/runner .
```

Run container
```
docker run -it --privileged --volume="$PWD/result:/result" osv/runner
```

After starting the container you will end up in /capstan-apps that contains number of example apps. Each app directory contains instruction how to compose and run OSv image. 

Please note that during the build thase this container pulls OSv kernel and mpm package artifacts from OSv github releases repo (see download_packages.sh) and installs them under $HOME/.capstan. 
