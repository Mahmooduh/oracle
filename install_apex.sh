#!/bin/bash
set -e

echo "Downloading Oracle APEX latest..."
curl -o /tmp/apex-latest.zip -L https://download.oracle.com/otn_software/apex/apex-latest.zip

echo "Extracting APEX..."
cd /tmp && unzip -q apex-latest.zip && rm apex-latest.zip

echo "Installing APEX..."
sqlplus -s / as sysdba @/tmp/install_apex.sql

echo "APEX installation completed!"
