FROM nextcloud:25.0.4

RUN apt update && apt install -y smbclient libsmbclient-dev && pecl install smbclient && docker-php-ext-enable smbclient
