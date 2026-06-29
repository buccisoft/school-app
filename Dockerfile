FROM php:8.3-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git curl zip unzip libpng-dev libonig-dev libxml2-dev libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip curl \
    && a2enmod rewrite

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Create .env file from environment variables
RUN echo "APP_KEY=${APP_KEY}" > .env \
    && echo "APP_ENV=${APP_ENV}" >> .env \
    && echo "APP_DEBUG=${APP_DEBUG}" >> .env \
    && echo "APP_URL=${APP_URL}" >> .env \
    && echo "DB_CONNECTION=${DB_CONNECTION}" >> .env \
    && echo "DB_HOST=${DB_HOST}" >> .env \
    && echo "DB_PORT=${DB_PORT}" >> .env \
    && echo "DB_DATABASE=${DB_DATABASE}" >> .env \
    && echo "DB_USERNAME=${DB_USERNAME}" >> .env \
    && echo "DB_PASSWORD=${DB_PASSWORD}" >> .env

# Install dependencies
RUN composer install --no-dev --optimize-autoloader

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Configure Apache to serve from public folder
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

EXPOSE 80
CMD ["apache2-foreground"]