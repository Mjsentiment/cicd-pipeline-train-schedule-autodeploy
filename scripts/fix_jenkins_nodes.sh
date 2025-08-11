#!/bin/bash

echo "Cleaning Gradle cache..."
rm -rf /var/lib/jenkins/.gradle/.tmp
rm -rf /var/lib/jenkins/.gradle/8.3/checksums

echo "Updating Node.js to v20.x..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Verifying Node.js and npm versions..."
node -v
npm -v

echo "Done. Please rerun your build."
