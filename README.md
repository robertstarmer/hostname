Login to your registry (e.g. hub.docker.com by default)

docker login
username: xxxx
password: xxxx

Build the image

docker build --build-arg VERSION=v1 . -t {username}/hostname:v1

Push the image

docker push -t {username}/hostname:v1

Run the image:

docker run --rm --name hostname -p 8080:80 -d rstarmer/hostname:v1

Test that the image works:

curl http://localhost:8080

Stop the running instance:

docker stop hostname

Clean up the local build/run environment:

docker rmi rstarmer/hostname:v1
docker rmi nginx:latest

