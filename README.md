my-ubuntu-with-docker
===

ð§ + ðģ docker compose åĨããŪ ubuntu image ã§ãã
įĐšãĢã―ãŪ ubuntu ãæãŦåĨãããĻãã docker compose ããĪãģãđããžãŦãããūã§ãŪæé æļã§ããããūãã

## When you install this on your Desktop

```bash
# Chekc you have docker command on your host machine.
docker --version

# Build an image from ./Dockerfile
# Run this after updating Dockerfile!
# NOTE: docker compose ãä―ŋãã° docker compose build ã§į°ĄåãŦæīæ°ã§ãããã
#       äŧåãŊã·ãģããŦããåŠåããĶããã
docker build -t my-ubuntu-with-docker .

# Create container from the image
# --name: Container name.
# -p: localhost:8888 to container:80
# -e: If you want env vars.
# -v docker.sock: Use host machine's docker.
# Image that the container created from.
docker run -it -d \
    --name my-ubuntu-with-docker-container \
    -p 8888:80 \
    -e Foo=foo \
    -v /var/run/docker.sock:/var/run/docker.sock \
    my-ubuntu-with-docker

# Enter in the container
docker exec -it my-ubuntu-with-docker-container sh

# Check ubuntu version.
# NOTE: "No LSB modules are available." ãŊæ°ãŦããŠããĶããã
lsb_release -a

# Check ubuntu architecture.
# NOTE: Docker Engine ãŪ Prerequisites ãŦ OS Versions ãĻ architectures ããããŪã§įĒščŠããã
arch

# Verify that Docker Engine is installed correctly by running the hello-world image.
sudo docker run hello-world

# Stop the container.
docker stop my-ubuntu-with-docker-container

# Remove the container.
docker rm my-ubuntu-with-docker-container

# --- nginx â

# Run nginx
nginx

# Get nginx status
service nginx status

# Quit nginx
nginx -s quit
```

## You you install docker compose on your own ubuntu

Refer to ./Dockerfile.
