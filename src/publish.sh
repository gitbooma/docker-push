
echo "in publish"
#DOCKER_COMPOSE_FILE="$1"
echo "10000000000 $TAG"
echo "Theme $THEME"


if [ -n "${THEME}" ]; then
TAG="$THEME-$TAG"
echo "combine"
echo $TAG
fi

echo "outside"
echo $TAG

TAG=$TAG docker-compose -f $DOCKER_COMPOSE_FILE up --no-start --remove-orphans
echo "compose done"

docker compose push