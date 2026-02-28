# Oracle 21c with APEX 24 Setup

## Prerequisites
1. Download APEX 24.1 from Oracle: https://www.oracle.com/tools/downloads/apex-downloads.html
2. Place `apex_24.1.zip` and `LINUX.X64_213000_db_home.zip` in this directory

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
