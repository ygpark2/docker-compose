CSRF_TOKEN=$(curl http://192.168.1.192:7750/pulsar-manager/csrf-token)

curl \
   -H 'X-XSRF-TOKEN: $CSRF_TOKEN' \
   -H 'Cookie: XSRF-TOKEN=$CSRF_TOKEN;' \
   -H "Content-Type: application/json" \
   -X PUT http://192.168.1.192:7750/pulsar-manager/users/superuser \
   -d '{"name": "admin", "password": "apachepulsar", "description": "test", "email": "test@test.org"}'
