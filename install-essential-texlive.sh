#!/bin/bash
# Install essential LaTeX packages for Overleaf
# Covers 95% of use cases including NASA, IEEE, ACM templates
# Size: ~1-2GB (vs ~7GB for scheme-full)

set -e

echo "=========================================="
echo "Installing Essential TeX Live Packages"
echo "=========================================="
echo ""

# Update tlmgr
echo "Step 1/3: Updating tlmgr..."
tlmgr update --self

# Install core collections
echo ""
echo "Step 2/3: Installing core collections..."
tlmgr install \
  collection-latex \
  collection-latexrecommended \
  collection-latexextra \
  collection-fontsrecommended \
  collection-bibtexextra \
  collection-pictures \
  collection-mathscience \
  biber

# Install NASA template specific packages
echo ""
echo "Step 3/3: Installing template-specific packages..."
tlmgr install \
  glossaries \
  glossaries-extra \
  titlesec \
  titletoc \
  mcode \
  tocloft \
  vhistory \
  wallpaper \
  lettrine \
  cleveref \
  csquotes \
  alphalph \
  arrayjobx \
  multido

echo ""
echo "=========================================="
echo "✅ Installation Complete!"
echo "=========================================="
echo ""
echo "Installed packages cover:"
echo "  - NASA LaTeX templates"
echo "  - IEEE, ACM, AIAA templates"
echo "  - Most academic document classes"
echo "  - Common math, graphics, and bibliography packages"
echo ""
echo "If you need additional packages, run:"
echo "  tlmgr install <package-name>"
echo ""
