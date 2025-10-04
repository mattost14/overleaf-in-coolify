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

### 1. Create Admin Account
1. Visit `http://your-server/launchpad`
2. Create your admin account
3. Login at `/login`

### 2. Install Full TeX Live (One-Time Setup) ⚠️ REQUIRED

**To enable ALL LaTeX packages** (NASA templates, IEEE, ACM, etc.), run this **once** in your Overleaf container terminal:

```bash
tlmgr update --self && tlmgr install scheme-full
```

**What this does:**
- Downloads ~7GB of LaTeX packages (takes 10-20 minutes)
- Fixes "package not found" errors for all templates
- **Only needed once** - packages persist in `./data/texlive/` across redeployments

**Without this step**, many LaTeX templates won't compile!

## Data Persistence

Ensure Coolify persists these volumes:
- `./data/sharelatex` - Project files and user data
- `./data/mongo` - MongoDB database
- `./data/redis` - Redis cache
- `./data/texlive` - LaTeX packages (after running tlmgr install)

## Upgrading

Change the image tag in `docker-compose.yml`:
```yaml
image: sharelatex/sharelatex:5.6.0  # Update version
```
