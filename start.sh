#!/bin/bash

# Fix permissions at runtime
chown -R www-data:www-data /var/www/html/storage
chown -R www-data:www-data /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage
chmod -R 775 /var/www/html/bootstrap/cache

echo "Running migrations..."
php artisan migrate --force

echo "Running seeders..."
php artisan db:seed --class=StudentSeeder --force

echo "Starting Apache..."
apache2-foreground