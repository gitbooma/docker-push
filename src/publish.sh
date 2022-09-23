
echo "in publish"
DOCKER_COMPOSE_FILE="$1"
TAG="env.$TAG"
echo "1 $TAG"

TAG=$TAG docker-compose -f $DOCKER_COMPOSE_FILE up --no-start --remove-orphans
echo "compose done"
IMAGES_OUTPUT=$(docker images)
echo "docker ps names"
echo $IMAGES_OUTPUT

#TAG=docker ps --format '{{.Image}}
docker compose push
docker compose start