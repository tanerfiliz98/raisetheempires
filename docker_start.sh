#!/bin/bash

ls -la

echo "Flask server is starting on port 5111..."

exec python empires-server.py --host 0.0.0.0 --port 5111 --no-popup