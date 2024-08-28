from http.server import HTTPServer, SimpleHTTPRequestHandler
import ssl

server_address = ('', 4443)
httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)

httpd.socket = ssl.wrap_socket(httpd.socket,
                               keyfile="/app/server.key",
                               certfile="/app/server.crt",
                               server_side=True)

print("Serving on port 4443...")
httpd.serve_forever()
