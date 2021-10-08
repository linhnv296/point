FROM php:7.2-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    nodejs \
    npm \
    supervisor \
    cron \

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Change current user
USER root

COPY ./dev/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./dev/cron /etc/cron.d/self-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/self-cron

# Apply cron job
RUN crontab /etc/cron.d/self-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log


# Copy codebase
COPY . .

RUN mkdir -p storage/framework/cache/data storage/app storage/framework/sessions storage/framework/views

COPY ./dev/nginx/build.conf /etc/nginx/conf.d/default.conf
COPY ./dev/nginx/supervisord.conf /etc/supervisor/conf.d/nginx.conf

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

ADD . /var/www
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www/storage
# Change current user to www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
