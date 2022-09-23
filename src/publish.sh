
echo "in publish"
DOCKER_COMPOSE_FILE="$1"

#docker login ghcr.io -u ${GITHUB_REF} -p ${REPO_TOKEN}
TAG=$(git rev-parse --short HEAD)
echo "VER=$TAG"

TAG=$TAG docker-compose -f $DOCKER_COMPOSE_FILE up --remove-orphans
echo "compose done"
IMAGES_OUTPUT=$(docker ps --format '{{.Image}})
echo "docker ps names"
echo $IMAGES_OUTPUT

#for IMAGE in $IMAGES; do
  #  echo "IMAGE: $IMAGE"
    
   # NAME=$(basename ${GITHUB_REPOSITORY}).$(docker inspect --format '{{ index .Config.Labels "name" }}' $IMAGE)
   # NAME=$(docker inspect --format '{{ index .Config.Labels "name" }}' $IMAGE)
    #echo "NAME=$NAME"
    #TAG="ghcr.io/${GITHUB_REPOSITORY}/$NAME:$VERSION"
    #TAG="${DOC_USER}/${IMAGE:10}:$VERSION"
    #echo $TAG

    #docker tag $IMAGE $TAG
    #TAG=docker ps --format '{{.Image}}
    docker compose push
#done
