from http.server import BaseHTTPRequestHandler, HTTPServer
class handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type','text/html')
        self.end_headers()
        self.wfile.write(b"<h1>Hello World from Python</h1>")
with HTTPServer(('', 8000), handler) as server:
    server.serve_forever()
