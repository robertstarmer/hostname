#!/bin/sh

# Change the file to create a new container

HOSTNAME=`hostname`
VERSION=${VERSION:-v1}
cat > /usr/share/nginx/html/index.html <<EOF
<HTML>
<HEAD>
<TITLE>This page is on $HOSTNAME and is version $VERSION</TITLE>
</HEAD><BODY>
<H1>THIS IS HOST $HOSTNAME</H1>
<H2>And we're running version: $VERSION</H2>
</BODY>
</HTML>
EOF

mkdir /usr/share/nginx/html/healthz /usr/share/nginx/html/hostname /usr/share/nginx/html/version
cat > /usr/share/nginx/html/hostname/index.html <<EOF
$HOSTNAME -- $VERSION
EOF
cat > /usr/share/nginx/html/version/index.html <<EOF
$VERSION
EOF
chmod 777 /usr/share/nginx/html/healthz
cat > /usr/share/nginx/html/healthz/index.html <<EOF
healthy
EOF

nginx -g "daemon off;"
