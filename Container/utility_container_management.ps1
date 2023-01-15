# Utility containers are meant to be install dependencies without needing a local installation.
# for example, installing the node.js package.json
docker run --name utilitycontainer -d -it node
# docker exec -it containerName bash_command
docker exec -it utilitycontainer npm init

# or use directly with the instanciation
docker run --name utilitycontainer -it -v "path:/app" node npm init

