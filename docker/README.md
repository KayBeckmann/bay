# Dockerisierung

Der Compose-Stack startet Frontend (Flutter Web via Nginx), das Serverpod-Backend sowie Postgres & Redis.

```bash
cp backend/bay_serverpod_server/config/passwords.yaml.example backend/bay_serverpod_server/config/passwords.yaml
cp env-example .env
docker compose -f docker/docker-compose.yml up --build
```

Relevante Ports:
- Frontend: `FRONTEND_PORT` (Standard `3000`)
- Backend API: `BACKEND_PORT` (Standard `8080`)
- Postgres: Host-Port `POSTGRES_HOST_PORT` (Standard `8090`)
- Redis: `8091`
