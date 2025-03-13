#!/bin/bash

redis-server --protected-mode no --appendonly no --maxmemory 500mb --maxmemory-policy allkeys-lru #--bind 0.0.0.0