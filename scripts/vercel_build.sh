#!/bin/bash
set -e

# ---------------------------------------------------------------------------
# Vercel Build Script — Portfolio Variant System
#
# Each Vercel project sets a VARIANT environment variable:
#   flutter           → Flutter generalist portfolio (default)
#   ios_native        → iOS native Swift portfolio
#   android_native    → Android native Kotlin portfolio
#   flutter_ios       → Flutter + iOS specialist portfolio
#   flutter_android   → Flutter + Android specialist portfolio
#
# Set VARIANT in: Vercel project → Settings → Environment Variables
# ---------------------------------------------------------------------------

VARIANT="${VARIANT:-flutter}"
echo "▶ Building portfolio variant: $VARIANT"

# Install Flutter if not already available (Vercel containers are ephemeral)
if ! command -v flutter &> /dev/null; then
  echo "▶ Flutter not found — installing..."
  git clone https://github.com/flutter/flutter.git \
    --depth 1 \
    --branch stable \
    "$HOME/flutter"
  export PATH="$PATH:$HOME/flutter/bin"
fi

# Verify Flutter is working
flutter doctor --android-licenses < /dev/null || true
flutter doctor

# Build web with the variant injected at compile time
flutter build web \
  --release \
  --dart-define=VARIANT="$VARIANT"

echo "✓ Build complete → build/web"
