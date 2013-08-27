#!/bin/bash

TMP_DIR=/tmp/publish_$$
mkdir -p $TMP_DIR
cd $TMP_DIR

VERSION=$1
USER=$2

echo "Version: $VERSION"

echo "Cloning git repos"
git clone -b gh-pages https://$USER@github.com/betfair/maven-test-process-plugin.git gh-pages
git clone -b $VERSION https://$USER@github.com/betfair/maven-test-process-plugin.git source
git clone -b $VERSION https://$USER@github.com/betfair/maven-test-process-plugin-documentation.git doco-source

if [ $VERSION == "master" ]; then
  echo "Need to parse pom.xml"
#  exit 1
fi

if [ -d gh-pages/$VERSION ]; then
  echo "Cleaning out old site content for branch $VERSION"
  cd gh-pages
  git rm -rf $VERSION
  cd ..
fi

echo "Generating maven site"
mkdir -p gh-pages/$VERSION/maven
cd source
mvn site:site site:deploy -Dsite.deploy.dir=$TMP_DIR/gh-pages/$VERSION/maven
cd ..

echo "Copying maven site into place"
cp -R doco-source/* gh-pages/$VERSION

echo "Telling git about our changes"
cd gh-pages
find $VERSION -exec git add {} \;
cd ..

echo "Pushing to live"
cd gh-pages
git commit -a -m "Pushing latest site updates"
git push origin gh-pages
cd ..

echo "Cleanup.."
rm -rf $TMP_DIR
