Follow the steps to play with docker images.

1. Create a file named Dockerfile
2. Create a index.html file
3. Build the image first
    docker build . -t webserver:v1
4. List the images
    docker images | grep webserver
5. Run command for building an image 
    docker run -d -p 1234:80 webserver:v1
6. Listing the same 
    docker ps -a | grep webserver
7. To test the same 
    curl http://localhost:1234/ 
    if it failes 
    docker logs d74eba185a7c

8. In case of failure remove container then image 
    docker container rm <container_id>
    docker image rm <image_id>

9. Start again
10. Listing docker running containers 
    docker ps | grep webserver

11. Killing it
    docker kill <id>

> Tagging docker images
docker tag 28d155f575e7 arun161087/webserver

> Pushing this in repository
docker push arun161087/webserver
