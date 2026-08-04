#!/usr/bin/env bash

set -euo pipefail

SRC_SFDIR="./XF_Nstf.sfdir"
OUT_DIR="fonts"

mkdir -p "${OUT_DIR}"

echo "🔨 Building fonts from ${SRC_SFDIR}..."

fontforge -lang=py -c "
import fontforge, sys

sfdir_path = sys.argv[1]
out_dir = sys.argv[2]

print('  -> Loading sfdir...')
font = fontforge.open(sfdir_path)

print('  -> Generating OTF...')
font.generate(f'{out_dir}/XF_Nstf.otf')

print('  -> Generating TTF...')
font.generate(f'{out_dir}/XF_Nstf.ttf')

print('  -> Generating WOFF2...')
font.generate(f'{out_dir}/XF_Nstf.woff2')

font.close()
" "${SRC_SFDIR}" "${OUT_DIR}"

echo "Build complete! Output files are in ${OUT_DIR}/"
