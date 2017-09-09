FROM jitesoft/composer:latest
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>"

ENV PHPUNITVERSION="^6.3"

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && composer selfupdate \
    && composer global require "phpunit/phpunit: ${PHPUNITVERSION}" --prefer-source --no-interaction

WORKDIR /app

ENTRYPOINT ["phpunit"]
CMD ["--help"]
