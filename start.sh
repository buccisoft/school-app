#!/bin/bash

# Set system temp directory
export TMPDIR=/tmp
mkdir -p /tmp

# Create storage directories
mkdir -p /var/www/html/storage/framework/views
mkdir -p /var/www/html/storage/framework/cache
mkdir -p /var/www/html/storage/framework/sessions

# Set permissions
chown -R www-data:www-data /var/www/html/storage
chmod -R 775 /var/www/html/storage

echo "Running migrations..."
php artisan migrate --force

echo "Running seeders..."
php artisan db:seed --class=StudentSeeder --force

echo "Starting Apache..."
apache2-foreground