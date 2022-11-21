envsubst < /app/src/backend_template.conf > /app/src/backend.conf
exec "$@"