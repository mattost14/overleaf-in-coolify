# Fix Missing LaTeX Packages in Overleaf

Your Overleaf instance is using a **minimal TeX Live** installation. Here's how to fix it:

## Solution: Install Full TeX Live (One-Time Setup)

### In Coolify - Overleaf Container Terminal:

Run these commands **once**:

```bash
# Update tlmgr
tlmgr update --self

# Install scheme-full (includes ALL packages - ~7GB)
tlmgr install scheme-full
```

**OR** install only the packages you need:

```bash
# Install common packages
tlmgr install \
    glossaries glossaries-extra \
    titlesec titletoc \
    fancyhdr caption subcaption \
    biblatex biber \
    mcode listings \
    tocloft vhistory wallpaper lettrine \
    cleveref csquotes alphalph \
    arrayjobx multido
```

### Wait Time

- **Full installation** (`scheme-full`): 10-30 minutes, ~7GB download
- **Selective packages**: 2-5 minutes, ~500MB

### Verification

After installation, test in Overleaf:
1. Create new project
2. Upload NASA template
3. Compile - should work without errors!

## Alternative: Use Pre-Built Full Image

If you want to avoid manual installation every time you restart:

### Option A: Switch to Full TeX Live Image

Unfortunately, the `sharelatex/sharelatex:5.5.4` image uses a minimal TeX Live, and there's no easy way to change this without rebuilding the image.

### Option B: Create Custom Dockerfile (Advanced)

Create a custom image with full TeX Live pre-installed:

```dockerfile
FROM sharelatex/sharelatex:5.5.4

# Install full TeX Live
RUN tlmgr update --self && \
    tlmgr install scheme-full && \
    tlmgr path add
```

Build and push to Docker Hub, then update docker-compose.yml to use your custom image.

---

## Quick Fix (Recommended)

**Just run this once in your Overleaf container:**

```bash
tlmgr install scheme-full
```

Then all LaTeX templates will work forever (until you delete the container data).
