docker-cleanup() {
  docker ps -a | grep Exit | awk '{print $1}' | xargs docker rm
}

docker-cleanupi() {
  docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi
}

docker-ip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}'
}

docker-kill() {
  docker kill $(docker ps -q)
}

docker-vars() {
  while IFS='' read -r line || [[ -n $line ]]; do
    [[ $line == '#'* ]] || echo -n "-e $line "
  done < "$1"
}

# Normally docker is aliased to this, for now it's disabled with new Docker.app
docker-env() {
  if [[ -z "$DOCKER_HOST" ]]; then
    eval $(docker-machine env dockerhost)
  fi
  \docker $@
}

bashof(){
   dcrun "$1" $2
}
​
rubycopof(){
   dcrun "$@" bundle exec rubocop -D
}
​
​
cleandocker(){
   IMAGESINFO=$(docker images --no-trunc --format '{{.ID}} {{.Repository}} {{.Tag}} {{.CreatedSince}}' | grep -E " (weeks|months|years)")
   TAGS=$(echo "$IMAGESINFO" | awk '{ print $2 ":" $3 }' )
   IDS=$(echo "$IMAGESINFO" | awk '{ print $1 }' )
​
   echo remove old images TAGS=$TAGS IDS=$IDS
​
   for t in $TAGS; do docker rmi $t; done
   for i in $IDS; do docker rmi $i; done
   
   echo "Done!"
}
​
gpurm(){
   grup -p
   git pull --rebase upstream master
   gloga
}
​
logsfor() {
   d logs -f $1
}