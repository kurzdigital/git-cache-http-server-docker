from node:alpine

run apk add --no-cache git tini
run npm install -g git-cache-http-server

expose 8080

volume ["/tmp/cache/git"]

stopsignal SIGTERM

entrypoint ["/sbin/tini", "--"]

cmd ["git-cache-http-server", "--port", "8080", "--cache-dir", "/tmp/cache/git"]
