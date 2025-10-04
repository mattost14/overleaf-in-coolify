# TeX Live Full Installation - One-Time Setup

After deploying Overleaf to Coolify, run these commands **once** in the container terminal:

```bash
tlmgr update --self
tlmgr install scheme-full
```

## What This Does

- Installs ALL LaTeX packages (~7GB, takes 10-20 minutes)
- Packages are saved to `./data/texlive/` on your host
- **Survives redeployments** - you only need to do this once!

## After Installation

- All LaTeX templates will work (NASA, IEEE, ACM, etc.)
- No more "package not found" errors
- Packages persist across container restarts and redeployments

That's it!
