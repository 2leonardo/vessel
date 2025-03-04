#!/bin/sh

VESSEL="https://github.com/2leonardo/vessel.git"

echo "Cloning vessel"
git clone $VESSEL .

# Remove git
rm -rf .git

# Remove everything but src
find . -mindepth 1 -not -path './src*' -exec rm -rf {} +

# Copy all files from the src directory to the current directory
ls -A ./src | xargs -I {} cp -r "./src/{}" .

# Remove src
rm -rf ./src

# Initialize a new git repository
echo "Initializing git"
git init

# Install npm dependencies
echo "Installing npm dependencies"
npm i

echo "Vessel has been initialized in your project"
