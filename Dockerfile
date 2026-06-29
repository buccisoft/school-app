FROM serversideup/php:8.3-apache

# Set the webroot to the public folder (this image does this automatically)
ENV WEBROOT=/var/www/html/public

# Copy all your code into the container
COPY . /var/www/html

# Install composer dependencies
RUN composer install --no-dev --optimize-autoloader

# Set the correct permissions (this image handles this too)
RUN php artisan optimize