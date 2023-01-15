# ========================================================= Configuration ========================================================= #
# ==> Pull the 'node' image (hub or locally)
FROM node:latest

# all the subsequent command will be executed in that folder
WORKDIR /app

# ========================================================= Installation ========================================================= #
# first .   => which fodler contains the docker file
# second .  => path inside the image, where the files should be stored (at the root here)
# COPY . .
COPY package.json /app

# node installation
# RUN command is only executed when installing the image in a container
RUN npm install

COPY . /app

# ========================================================= Execution ========================================================= #
# Default ARG variable used for building image
ARG DEFAULT_PORT=8000

# ENV variable used for building container and store in memory variable
ENV PORT $DEFAULT_PORT
ENV PORT 80

# Expose the wanted port to access it => It is only documentation it won't open the port
# when running the container with that image :
# docker run -p 80:80 c25cd1f810cf | -p for publish | 80:80 = external machine port access:internal container port access
EXPOSE 80
EXPOSE $PORT

# share a folder with the local machine so we can serialize data
# VOLUME [ "path_inside_container"] => managed by docker so not permanent through removal of a container
VOLUME ["/app/feedback"] 

# CMD command is only used to launch a container
CMD ["node", "server.js"]

# Entrypoint is not overrided as CMD
ENTRYPOINT [ "npm" ]

