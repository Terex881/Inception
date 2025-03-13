#!/bin/bash

# Start Redis with the required options
redis-server --protected-mode no --appendonly no --maxmemory 500mb --maxmemory-policy allkeys-lru #--bind 0.0.0.0