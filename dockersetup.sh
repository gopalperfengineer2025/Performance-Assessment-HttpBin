#!/bin/bash
# Run HTTPBin locally
docker run -d --name httpbin -p 8000:80 postmanlabs/httpbin:latest