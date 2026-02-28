# Oracle 21c with APEX 24 Setup

## Prerequisites
1. Place `LINUX.X64_213000_db_home.zip` in this directory
2. APEX will be downloaded automatically during build

## Setup
```bash
# Build and start
docker-compose up -d

# Monitor logs
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
