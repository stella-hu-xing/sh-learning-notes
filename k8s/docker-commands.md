# list all images in current host

docker image ls

# build a image from current folder (where the Dockerfile lives)

docker build . -t my-image-name

# list all containers, including the stopped ones

docker ps -a

# Run an instance of the image and publish container port 8080 to 8383 on the host.

docker run -p 8383:8080 webapp-color:lite

# Remove unused images

docker image prune

# check status

docker inspect
