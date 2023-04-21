FROM nextcloud:26.0.1

RUN apt update && apt install -y smbclient libsmbclient-dev && pecl install smbclient && docker-php-ext-enable smbclient
