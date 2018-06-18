# Docker OSv runner
Docker container along with other scripts to demonstrate running various apps on OSv

Build container
```
docker build -t osv/runner .
```

Run container
```
docker run -it --privileged --volume="$PWD/result:/result" osv/runner
```
