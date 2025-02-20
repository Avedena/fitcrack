#!/bin/bash

# Make collections directory tree
# This file is part of Fitcrack installer
# Author: Radek Hranicky (ihranicky@fit.vutbr.cz)

echo "Creating directories for common collections..."
# Create collections dir (if not exists)
if ! [ -d "/usr/share/collections" ]; then
  mkdir /usr/share/collections
fi

# Create default import destination
if ! [ -d "/usr/share/collections/import" ]; then
  mkdir /usr/share/collections/import
fi

# Create collections subdirs
if ! [ -d "/usr/share/collections/charsets" ]; then
  cp -R collections/charsets /usr/share/collections/
fi

if ! [ -d "/usr/share/collections/dictionaries" ]; then
  cp -R collections/dictionaries /usr/share/collections/
fi

if ! [ -d "/usr/share/collections/markov" ]; then
  cp -R collections/markov /usr/share/collections/
fi

if ! [ -d "/usr/share/collections/encrypted-files" ]; then
  cp -R collections/encrypted-files /usr/share/collections/
fi

if ! [ -d "/usr/share/collections/masks" ]; then
  cp -R collections/masks /usr/share/collections/
fi

if ! [ -d "/usr/share/collections/rules" ]; then
  cp -R collections/rules /usr/share/collections/
fi

if ! [ -d "/usr/share/collections/pcfg" ]; then
  #cp -R collections/pcfg /usr/share/collections/
  cp collections/pcfg.tar.gz /usr/share/collections/
  cd /usr/share/collections/
  tar xzvf pcfg.tar.gz
  rm pcfg.tar.gz
  cd $INSTALLER_ROOT
fi

# Set ownership and permissions
chown -R $APACHE_USER:$APACHE_GROUP /usr/share/collections
chmod -R 777 /usr/share/collections

echo "Directories for common collections created."
