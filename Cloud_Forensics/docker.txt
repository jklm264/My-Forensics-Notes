# Run regular

1. docker build -t myimage .
	- will build image (might just grab cache)
	- look for "Successfully built"
	- -t name's the image
2. docker images
	- to verify
3. docker run -p [port e.g. 80:2641] myimage --name=App1
	- App1 name's the container
	- **Run Interactive** `docker run -it %username%/%proj_name% /bin/bash`
4. docker ps
	- to verify
5. docker stop [containerID]
	- will 'correctly' stop a container

## Build and push then pull

`docker image build -t %username%/%proj_name% .`

`docker image push %username%/%proj_name%`

`docker pull %username%/%proj_name%`

`docker image build -t %username%/%proj_name% . && docker image push %username%/%proj_name% && docker pull %username%/%proj_name%`

## Stop an Instance

`docker ps`

`docker rm <name> -f`

## Extra Stuffs

[Docker Hub](https://hub.docker.com/r/tiangolo/uwsgi-nginx/)

# Troubleshooting

If you get error: `docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?.` just run Docker app from _Spotlight Search_

