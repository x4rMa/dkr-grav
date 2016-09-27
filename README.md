# Usage
## Build

    docker build -t gravcms .

## Run

    docker run -p 443:443 gravcms

Point your browser to https://localhost/admin and login with admin & P4ssW0rd.

## Build with custom nginx & server config

Use your own configs if you wish:

    docker build --build-arg nginx=my_nginx.conf server=my_server.conf -t gravcms .
