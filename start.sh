#!/bin/bash

# Set up permissions
chown -R nobody:nobody /var/www/html/storage
chown -R nobody:nobody /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage
chmod -R 775 /var/www/html/bootstrap/cache

# Run Laravel setup
echo "Running composer install..."
composer install --no-dev --working-dir=/var/www/html

echo "Generating application key..."
php artisan key:generate --force

echo "Caching configuration..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force

echo "Starting nginx and PHP-FPM..."
supervisord -c /etc/supervisord.conf