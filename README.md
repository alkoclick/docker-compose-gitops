# Docker Compose GitOps

Basic implementation of GitOps paradigm using docker-compose. 
This program continuously fetches a git repository
and updates docker-compose services.

## Usage

```
$ git clone <Git URL with docker-compose configuration>
$ gitops.sh
```

### With docker-compose

```yaml
# /path/to/subfodler/docker-compose.yml

services:
  ...
  gitops:
    image: ghcr.io/alkoclick/docker-compose-gitops:v1.1.0
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      # You have to match the paths inside and outside the container, otherwise docker compose will detect changes in your volume mounts because it uses absolute paths!
      - ${PWD}:${PWD}
    working_dir: ${PWD} # You can add any subpaths you may here as needed

```

## Original project

Credits to zeeke over at: https://github.com/zeeke/docker-compose-gitops
