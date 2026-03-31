#!/usr/bin/env bash
set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"
if ! command -v xcodegen >/dev/null 2>&1; then
  echo "xcodegen not found. Installing via Homebrew..."
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. 설치하거나 수동으로 xcodegen을 설치하세요: https://github.com/yonaskolb/XcodeGen"
    exit 1
  fi
  brew install xcodegen
fi
cd "$ROOT"
echo "Generating Xcode project from project.yml..."
xcodegen generate --spec "$ROOT/project.yml"
echo "Done. Open with: open ccq-scenario-trainer.xcodeproj"
