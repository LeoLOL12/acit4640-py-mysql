envsubst < backend_template.conf > backend.conf
exec "$@"