#!/bin/bash

# Set logging to stderr to avoid file permission issues
export LOG_CHANNEL=stderr

echo "Running migrations..."
php artisan migrate --force

echo "Running seeders..."
php artisan db:seed --class=StudentSeeder --force

echo "Starting Apache..."
apache2-foreground