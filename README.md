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

### 2. Install TeX Live Packages (Required for Advanced Templates) ⚠️

The Community Edition ships with minimal LaTeX packages. Choose one option:

#### Option A: Essential Packages (Recommended) ⭐

Covers 95% of use cases including NASA, IEEE, ACM templates. **~1-2GB, 5-10 minutes**

```bash
# Copy script to container (in Coolify terminal)
curl -o /tmp/install.sh https://raw.githubusercontent.com/mattost14/overleaf-in-coolify/master/install-essential-texlive.sh
bash /tmp/install.sh
```

Or manually:
```bash
tlmgr update --self
tlmgr install collection-latex collection-latexrecommended collection-latexextra \
  collection-fontsrecommended collection-bibtexextra collection-pictures \
  collection-mathscience biber
```

#### Option B: Full Installation (Everything)

Install ALL LaTeX packages. **~7GB, 10-20 minutes**

```bash
tlmgr update --self && tlmgr install scheme-full
```

#### What Gets Installed:

**Essential packages include:**
- NASA, IEEE, ACM, AIAA templates
- Common document classes (article, book, beamer)
- Bibliography tools (biblatex, biber)
- Math and graphics packages
- Most fonts

**Note:** Packages are installed inside the container. If you redeploy, you'll need to run this again. To avoid this, consider creating a custom Docker image with TeX Live pre-installed.

## Data Persistence

Ensure Coolify persists these volumes:
- `./data/sharelatex` - Project files and user data
- `./data/mongo` - MongoDB database
- `./data/redis` - Redis cache

## Upgrading

Change the image tag in `docker-compose.yml`:
```yaml
image: sharelatex/sharelatex:5.6.0  # Update version
```
