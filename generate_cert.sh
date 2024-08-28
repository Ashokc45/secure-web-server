


mkdir -p /certs


openssl genpkey -algorithm RSA -out /certs/server.key -aes256


openssl req -new -key /certs/server.key -out /certs/server.csr


openssl x509 -req -days 365 -in /certs/server.csr -signkey /certs/server.key -out /certs/server.crt


rm -f /certs/server.csr
