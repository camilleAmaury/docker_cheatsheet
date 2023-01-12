# List all containers even non executing ones
docker ps -a

# Create a container based on an image with port access (attach mode by default)
docker run -p 80:80 imageID
# Create a container based on an image with port access (detach mode)
docker run -p 80:80 -d imageID

# Stop a container
docker stop containerID
docker stop containerName

# Restart a container (detach mode by default)
docker start containerName
# Restart a container (attach mode)
docker start -a containerName

# when a container is detached, you can attached for future message
docker attach containerName
# when a container is detached, you can get the past logs
docker logs -f containerName

# interact with internal container code
# -i => access to input
docker run -i -t imageID
docker start -a -i containerName

# remove container manually
docker rm containerName1 containerName2 containerNameX ...

# remove container after stopping it
docker run -d --rm imageID

# copy files in an executing container
docker cp externalFolder/. containerName:/internalFolder
# copy files out of an executing container
docker cp containerName:/internalFolder externalFolder/

# name/tag container
docker run --name newContainerName imageID

# Volume are managed by docker so we don't the know the path
# volume are kept even if the container is removed
docker volume ls
# Bind mount are local files which are shared with your docker container
# an example of running docker without storing node_modules on local computer
# Volume : -v your_volume_name:/app_path/internal_volume
# -v /app/node_modules creates an anonymous volume shared and deleted by docker
# -v feedback:/app/feedback creates a named container which is managed by docker but not deleted
# -v "C:\Users\CAJug\Documents\Docker\data-volumes-02-added-dockerfile:/app" creates a bind mount of the local folder to the remote /app folder of the container
# -v "C:\Users\CAJug\Documents\Docker\data-volumes-02-added-dockerfile:/app:ro" creates a read only bind mount which can write on local files
docker run -v /app/node_modules imageID
docker run -v feedback:/app/feedback imageID
docker run -v "C:\Users\CAJug\Documents\Docker\data-volumes-02-added-dockerfile:/app" -v /app/node_modules imageID
docker run -v "C:\Users\CAJug\Documents\Docker\data-volumes-02-added-dockerfile:/app:ro" -v /app/node_modules imageID

# Set environnement variable you can use in application code => but careful for security
docker run --env-file "./.env"
# Set ARG, executed at build time and inacessible after

