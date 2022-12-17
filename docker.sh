#!/usr/bin/zsh

# Don't forget to run command "chmod +x docker.sh"

ARG1=${1:l}

case $ARG1 in
    "up")
        echo "Starting docker compose up"
        docker compose -p proxy-server up -d
        ;;
    "logs")
        echo "Starting docker logs"
        docker logs -f --tail all proxy-server-proxy-1
        ;;
    "down")
        echo "Starting docker compose down"
        docker compose -p proxy-server down
        ;;
    *)
        echo "Nothing happen"
        exit 1
esac