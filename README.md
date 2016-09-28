# Usage

## Basics
### Build

    ./install.sh && docker build -t gravcms .

### Run

    docker run -p 443:443 gravcms

Point your browser to https://localhost/admin and login with admin & P4ssW0rd.

## Customize

### Build with custom config files

Use your own configs if you wish:

    docker build --build-arg nginx=my_nginx.conf server=my_server.conf -t gravcms .

Of course, you can just override the default files (nginx.conf & server-ssl.conf) as well.

### Build with subfolder option
This is useful if you plan to have several grav instances (within their own containers) behind a front proxy.

    docker build --build-arg sub=SUBFOLDER -t gravcms .

## Examples

### User content


### Multiple instances
Suppose you have built images g1 and g2 so that they are configured
(on the level of nginx) to run at /usr/share/nginx/html/g1 and
/usr/share/nginx/html/g2, respectively. Then, if a frontrouter proxies
0.0.0.0/g1 to <docker-ip-of-g1>/g1 and
0.0.0.0/g2 to <docker-ip-of-g2>/g2,
both Grav instances should run frictionless.
