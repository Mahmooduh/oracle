# Oracle 21c with APEX 24 Setup

## Prerequisites
- APEX will be downloaded automatically during first startup

## Setup
```bash
# Build and start
docker-compose up -d

# Monitor logs (first startup takes 10-15 minutes)
docker-compose logs -f
```

## Access
- **Database**: localhost:1521
- **APEX**: http://localhost:8080/ords
- **Enterprise Manager**: https://localhost:5500/em

## Credentials
- **SYS Password**: Oracle123
- **APEX Admin**: ADMIN / Admin123
- **Workspace**: INTERNAL

## Notes
- First startup takes 10-15 minutes
- Change default passwords in production
