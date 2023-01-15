# execute a docker compose yaml file
# by default all services listed are build and executed
docker-compose up 
# else specify those you want
docker-compose up serviceName1 serviceName2 ...

# shutdown a docker compose yaml file
docker-compose down

# Running in detach mode
docker-compose up -d