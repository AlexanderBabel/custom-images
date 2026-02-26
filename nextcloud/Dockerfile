FROM nextcloud:33.0.0

RUN \
  case "$(uname -m)" in \
        aarch64) echo "Skpping AMD64 specific package" ;; \
        x86_64) sed -i -e's/ main/ main contrib non-free/g' /etc/apt/sources.list export EXTRA_INTEL="intel-media-va-driver-non-free" ;; \
  esac; \
  apt update && \
  apt install --no-install-recommends -y smbclient libsmbclient-dev ffmpeg $EXTRA_INTEL && \
  pecl install smbclient && docker-php-ext-enable smbclient
