cd /etc/nginx/sites-available
# We’ll first unlink the default site using
sudo unlink /etc/nginx/sites-enabled/default
# Then we’ll create a new file reverse-proxy.conf in the /etc/nginx/sites-available
sudo vim reverse-proxy.conf

server {
        listen 80;
        location / {
                proxy_pass http://localhost:3000;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection keep-alive;
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
        }
}
# listen 80;: Specifies that Nginx should listen on port 80 for incoming HTTP requests.
# location / { ... }: Defines a location block that matches any request path (/). This block contains directives for handling requests to the root location.
        # proxy_pass http://localhost:3000;: This directive specifies that incoming requests to the root location should be proxied to a Node.js application running on localhost at port 3000. 
# In other words, Nginx acts as a reverse proxy and forwards requests to your Node.js application.
# proxy_http_version 1.1;: Sets the HTTP version to 1.1 for the proxied requests.
# proxy_set_header Upgrade $http_upgrade;: This line sets the Upgrade header to the value of $http_upgrade.
        #  This is often used in conjunction with WebSocket applications to enable WebSocket upgrades.
# proxy_set_header Connection keep-alive;: Sets the Connection header to keep-alive for proxied requests, which is the standard behavior for HTTP connections to keep them open for reuse.
# proxy_set_header Host $host;: Sets the Host header in the proxied request to the original host value from the client's request. 
        # This is important when you have multiple virtual hosts (server blocks) configured on your Nginx server.
# proxy_cache_bypass $http_upgrade;: This directive is used to bypass the proxy cache when the $http_upgrade variable is set. 
        # It's commonly used in WebSocket setups to ensure that WebSocket requests are not cached.
# sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf


# Login
# You have logged into Microsoft Azure!
# You can close this window, or we will redirect you to the Azure CLI documentation in 1 minute.

# Announcements
# [Windows only] Azure CLI is collecting feedback on using the Web Account Manager (WAM) broker for the login experience.

# You may opt-in to use WAM by running the following commands:

az config set core.allow_broker=true
az account clear
az login