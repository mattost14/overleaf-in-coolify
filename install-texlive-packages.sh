#!/bin/bash
# Install commonly needed LaTeX packages for Overleaf

echo "Installing additional TeX Live packages..."

tlmgr update --self --all 2>/dev/null || true

# Install packages needed for NASA templates and most academic documents
tlmgr install \
    glossaries \
    glossaries-extra \
    titlesec \
    titletoc \
    fancyhdr \
    caption \
    subcaption \
    biblatex \
    biber \
    mcode \
    listings \
    tocloft \
    vhistory \
    wallpaper \
    lettrine \
    cleveref \
    csquotes \
    alphalph \
    arrayjobx \
    multido \
    scheme-full \
    2>/dev/null || echo "Some packages already installed or not available"

echo "TeX Live package installation complete!"
