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
    image: ghcr.io/alkoclick/docker-compose-gitops:v1.0.0
    working_dir: /git/path/to/subfolder # Optional. Use it if docker-compose.yml is not in the root
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./:/git  # Or ../../:/git to map git repo root to /git

```

## Original project

Credits to zeeke over at: https://github.com/zeeke/docker-compose-gitops
