my-ubuntu-with-docker
===

🐧 + 🐳 docker-compose 入りの ubuntu image です。
空っぽの ubuntu を手に入れたとき、 docker-compose をインストールするまでの手順書でもあります。

## When you install this on your Desktop

```bash
# Chekc you have docker command.
docker --version

# Build an image from ./Dockerfile
# Run this after updating Dockerfile!
# NOTE: docker-compose を使えば docker-compose build で簡単に更新できるが、
#       今回はシンプルさを優先している。
docker build -t my-ubuntu-with-docker .

# Create container from the image
# --name: Container name.
# -p: localhost:8888 to container:80
# -e: If you want env vars.
# Image that the container created from.
docker run -it -d \
    --name my-ubuntu-with-docker-container \
    -p 8888:80 \
    -e Foo=foo \
    my-ubuntu-with-docker

# Enter in the container
docker exec -it my-ubuntu-with-docker-container sh

# Check ubuntu version.
# NOTE: "No LSB modules are available." は気にしなくていい。
lsb_release -a

# Stop the container.
docker stop my-ubuntu-with-docker-container

# Remove the container.
docker rm my-ubuntu-with-docker-container

# ---

# Run nginx
nginx

# Get nginx status
service nginx status

# Quit nginx
nginx -s quit
```

## You you install docker-compose on your own ubuntu

Refer to ./Dockerfile.