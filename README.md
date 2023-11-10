# Proxier

A simple tool to proxy request to user-defined network

# Usecase

You use docker-compose to orchestrate stack on local. 
But you work on multiple projects, as such, you don't want to bring down and up the whole structure every single switch.

The biggest problem is PORT pollution. Common port for databases, web are similar between those.

# Solution

Don't expose port to the local machine. Instead, use proxier on demand, as your project needed.

# Usage
```
docker run -it --rm --name proxier \
  --network <docker-compose network> \
  -e PORTS_<port>=<service_name>:<target_port> \
  -e PORTS_<port>=<service_name>:<target_port> \
  -p <local_port>:<target_port> \
  silentium/proxier
```

# Example
```bash
docker run -it --rm --name proxier \
  --network project \
  -p 80:80 \
  -p 6379:6379 \
  -e PORTS_80=nginx:80 \
  -e PORTS_6379=redis:6379 \
  silentium/proxier
```