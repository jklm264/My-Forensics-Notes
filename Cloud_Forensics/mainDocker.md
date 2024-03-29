# Docker Notes

[CTFd setup via docker](ctfd_setup.txt)

[Planka setup via docker](https://github.com/plankanban/planka#deploy)

## Notes ToC

- [TLDR](#TLDR)
- [General Info about containers](containers.md)
- [Low-level details about containers; docker focused](docker101.md)
- [Basics](#Basics)
- [Webapps](#Webapps---Static-Sites)
- [Docker Images](#Docker-Images)
- [Working with Multiple Containers/Docker Network](#Multi-Container-Environments)
- [Docker Compose](#Docker-Compose)
- [Docker Use-Cases](useCases.md)
- [Troubleshooting on Mac](#Troubleshooting)



### TLDR

To run: `$docker run --rm -p 8888:5000 -it <image>`

To delete: `$docker rmi <image_id>`



## Jargon

- Images - _blueprint_ and basis of containers
- Containers - created from an image, created using `$docker run ...`
- Docker Daemon - background service running on the host that managers building, running, and distributing the containers.
- Docker Client - cli tool
- Docker Hub - [registry](https://hub.docker.com/explore) of docker images



## Basics

### List/Delete

- List all images on your system: `$docker list`
- Delete an image: `$docker rmi <image_id>`
  - Delete multiple: `$docker images -a | grep "pattern" | awk '{print $3}' | xargs docker rmi`
  - Delete just containers (not images): `$docker rm <container_id>`
    - Also `$docker rm $(docker ps -a -q -f status=exited)` # _q_ returns ids, _f_ is filter
  - When you create the container you can delete the instance via: `$docker run --rm <image>`
- To keep a clean system: `$docker system prune -a`

### Status checks

- Check containers that are running `$docker ps`
	- Check containers that _have_ run: `$docker ps -a`
- `$docker stats` for all you nerds

### Running interactively

- To run a box interactively run an instance: `$docker run -it busybox sh`



## Webapps - Static Sites

- `$docker run -d -P --name static-site <image>`
	- _-d_ detaches the terminal
	- _-P_ publishes all exposed ports to random ports on host machines
	- _name_ is a canonical name

- List port mappings: `$docker port <image_name>`

- Can specify custom ports: `$docker run -p 8888:80 <image>` will map container's:80 to localhost:8888. Therefore, you will access container service via <http://localhost:8888>.

- To stop a detached container: `$docker stop <name|container_id>`



## Docker Images

- Listing all local images: `$docker images`

- Can search either on <hub.docker.com> or via cli with `$docker search`.

- Image types: 
	- Base vs Child
	- Official vs User

### Create your own

Goal: Run a flask app

1. Pick a base image: `FROM python:3`
2. Set a working directory for the app: `WORKDIR /usr/src/app`
3. Copy all the files needed to the container: `COPY . .`. Note, you already set the WORKDIR so in the COPY cmd the '.' (cwd) is really the WORKDIR set.
4. Install deps: `RUN pip install --no-chache-dir -r requirements.txt`
5. _Expose_ a port: `EXPOSE 5000`
6. Run the app on start: `CMD ["python", "./app.py"]`
7. `$docker build` creates an images from the Dockerfile.
	- can do `$docker build -t <username/appname> .`
	  - will build image (or from cache)
	  - _-t_ name of the image
	- to rename `$docker tag <old_name> <new_name>;docker rmi <old_name>`
8. Run the container: `$docker run -p 8888:5000 <image>`

```
#Dockerfile

FROM python:3
WORKDIR /usr/src/app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD ["python", "./app.py"]
```

### Addition Stuffs:

9. Push image to publish (think git push): l`$docker push <image>`



[My own](dockerfile) dockerfile.



## Multi-Container Environments

### Docker Network

- Show containers network status: `$docker network ls`
	- _Bridge_ network is run by default
	- More details via `$docker network inspect bridge`

### Create Docker Networks

- Why? Security.

- Create a new network: `$docker network create <new_networkname>`
	- creates as _bridge_ by default
- Then, run your container with new network: `$docker run --net <new_networkname> ...`

## Docker Compose

- Up 'til here we've focused on Docker Client. Now for the rest
	- Docker Machine - creates Docker hosts on your computer, cloud, and inside data centers.
	- Docker Compose - A tool for defining and running multi-container Docker applications
	- Docker Swarm - native clustering solution
	- Kubernetes - Open-source system to automate deployment, scaling, and management of containers.

So, Docker Compose, what was once a company called Fig, allowed devs ease to define and run multi-container Docker apps. Ideal for development and testing environments.

Enter, `docker-compose.yml`

```
version: "#"
services:
  service1:
    image: docker.elastic.co/...
    contianer_name: es
    environment:
      - any extra switches
      - ex: ediscovery.type=single-node #for es
    ports:
      - external:internal
    volumes:
      - esdata1:/usr/shar/elasticsearch/data
  service2:
    image: foodtrucks-web
    command: python app.py
    depends_on:
      - es
    ports:
      - external:internal
    volumes:
      - ./flask-app:/opt/flask-app
volumes:
  esdata1:
    driver: local
```

- Create and start: `$docker-compose up`
	- `-d` is detached
	- `$docker-compose down -v`

## Troubleshooting

If you get error: `docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?.` just run Docker app from _Spotlight Search_



## Further Reading

- [Docker "Swarm": Customizable Voting App](https://github.com/docker/labs/blob/master/beginner/chapters/votingapp.md)
   - [Voting App Source](https://github.com/dockersamples/example-voting-app)

- [Docker Curriculum](https://docker-curriculum.com)

   ## 
