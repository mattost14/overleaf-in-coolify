# Overleaf for Coolify

Simplified Overleaf deployment without the toolkit - ready for Coolify!

## Deployment Options in Coolify

### Option A: Docker Compose (This Repo)
1. Push this repo to your Git provider
2. In Coolify: **New Resource** → **Docker Compose**
3. Point to this repo
4. Deploy!

### Option B: Use Coolify's One-Click Overleaf Template
Coolify may have a pre-built Overleaf template you can use directly.

## Environment Variables

Add these in Coolify's environment settings (optional):

```bash
SHARELATEX_SITE_URL=https://your-domain.com
SHARELATEX_NAV_TITLE=Your Overleaf
SHARELATEX_ADMIN_EMAIL=admin@yourdomain.com
SHARELATEX_BEHIND_PROXY=true
```

## After Deployment

1. Visit `http://your-server/launchpad`
2. Create your admin account
3. Login at `/login`

## Data Persistence

Ensure Coolify persists these volumes:
- `./data/sharelatex` - Project files
- `./data/mongo` - Database
- `./data/redis` - Cache

## Upgrading

Change the image tag in `docker-compose.yml`:
```yaml
image: sharelatex/sharelatex:5.6.0  # Update version
```
