#!/bin/bash
set -e

echo "Cleaning Gradle and npm caches..."
rm -rf ~/.gradle/caches/
rm -rf ~/.gradle/.tmp/
rm -rf node_modules/
rm -f package-lock.json

echo "Updating Node.js to version 20.x..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Verifying Node and npm versions..."
node -v
npm -v

echo "Running Gradle build..."
./gradlew clean build --no-daemon

echo "Done. Please rerun your build if necessary."
