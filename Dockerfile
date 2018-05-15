
# use node latest image
FROM node:latest

# set maintainer
LABEL maintainer "abhiram.annangi@oracle.com"

# set health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# Instruct docker what port to expose
EXPOSE 8001

