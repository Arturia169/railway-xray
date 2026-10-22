#!/bin/sh
set -e
PORT="${PORT:-8080}"
UUID="${UUID:-45c01d8c-47f8-4bc1-bddb-1a9932b7372a}"
WSPATH="${WSPATH:-/ed73d26d}"
sed -i "s/__UUID__/${UUID}/g; s/__PORT__/${PORT}/g; s|__PATH__|${WSPATH}|g" /etc/xray/config.json
echo "xray starting on port ${PORT} path ${WSPATH}"
exec /usr/local/bin/xray run -config /etc/xray/config.json
