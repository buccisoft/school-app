#!/bin/bash

echo "Installing Composer dependencies..."
composer install --no-dev --no-interaction --prefer-dist --working-dir=/var/www/html

echo "Generating application key..."
php artisan key:generate --force --no-interaction

echo "Caching configuration..."
php artisan config:cache --no-interaction

echo "Caching routes..."
php artisan route:cache --no-interaction

echo "Running migrations..."
php artisan migrate --force --no-interaction

echo "Setting permissions..."
chown -R www-data:www-data /var/www/html/storage
chown -R www-data:www-data /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage
chmod -R 775 /var/www/html/bootstrap/cache

echo "Starting nginx and PHP-FPM..."
supervisord -c /etc/supervisord.conf