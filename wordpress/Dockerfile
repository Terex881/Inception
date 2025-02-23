FROM debian:bullseye

# Install necessary packages
RUN apt-get update -y && apt-get upgrade -y && \
    apt install -y curl git wget php7.4 php7.4-fpm php-mysql unzip

# Ensure WordPress directory exists
RUN mkdir -p /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress

# Copy the WordPress installation script
COPY wordpress.sh /wordpress.sh

# Make sure the script is executable
RUN chmod +x /wordpress.sh

# Run the script at container startup
ENTRYPOINT ["./wordpress.sh"]
