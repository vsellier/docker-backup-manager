#!/bin/bash

PLATFORMS="linux/amd64,linux/arm64,linux/arm/v7"

docker buildx build --platform ${PLATFORMS} -t vsellier/backup-manager:latest --push .
