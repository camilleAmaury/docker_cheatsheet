# list available images 
docker images

# remove image (only if not used by containers)
docker rmi imageID

# remove all unused image
docker image prune

# more information about an image
docker image inspect imageID

# name/tag images
docker build -t newImageName:newTagName .

# Build arguments that are passed only at building runtime, not accessible by the environment
docker build --build-arg DEFAULT_PORT=80 .