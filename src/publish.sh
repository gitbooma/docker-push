
echo "in publish"
DOCKER_COMPOSE_FILE="$1"
TAG="$2"

TAG=$TAG docker-compose -f $DOCKER_COMPOSE_FILE up --remove-orphans
echo "compose done"
IMAGES_OUTPUT=$(docker ps --format '{{.Image}})
echo "docker ps names"
echo $IMAGES_OUTPUT

    #TAG=docker ps --format '{{.Image}}
    docker compose push