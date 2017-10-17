## alpine kafka

Docker container with zookeeper and kafka

[docker-for-mac](https://docs.docker.com/docker-for-mac/install/)


#### Configuration

```
 Zookeeper 0.0.0.0:2181
 kafka 0.0.0.0:9092
```


### Build
```sh
docker build -t scotthaleen/alpine-kafka docker
```

### Run
```
docker run -p 2181:2181 -p 9092:9092 scotthaleen/alpine-kafka
```

### Docker Debugging

- zookeeper `echo ruok | nc localhost 2181`
- kafka ...

#### list all running containers
`docker ps -a`

#### attach to running container
`docker exec -it {container_id} sh`

