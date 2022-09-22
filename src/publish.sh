VERSION="$1"
OVERRIDE="$2"
#DOC_USER="$3"
DOC_USER="boomadevops"

echo "VERSION=$VERSION"
echo "doc_user=$DOC_USER"
echo "OVERRIDE=$OVERRIDE"


#docker login ghcr.io -u ${GITHUB_REF} -p ${REPO_TOKEN}

VERSION=$VERSION docker-compose -f $OVERRIDE up --no-start --remove-orphans
echo "compose done"
echo "VER=$VERSION"
IMAGES=$(docker inspect --format='{{.Image}}' $(docker ps -aq))

echo "IMAGES: $IMAGES"
for IMAGE in $IMAGES; do
    echo "IMAGE: $IMAGE"
    
   # NAME=$(basename ${GITHUB_REPOSITORY}).$(docker inspect --format '{{ index .Config.Labels "name" }}' $IMAGE)
    NAME=$(docker inspect --format '{{ index .Config.Labels "name" }}' $IMAGE)
    echo "NAME=$NAME"
    #TAG="ghcr.io/${GITHUB_REPOSITORY}/$NAME:$VERSION"
    TAG="${DOC_USER}/$NAME:$VERSION"
    echo $TAG

    docker tag $IMAGE $TAG
    docker push $TAG
done
