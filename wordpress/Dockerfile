FROM debian:bullseye

# Install necessary packages
RUN apt-get update -y && apt-get upgrade -y && \
    apt install -y curl git wget php php-fpm php-mysql unzip

# Ensure WordPress directory exists
RUN mkdir -p /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress

# Copy the WordPress installation script
COPY wordpress.sh /wordpress.sh

# Make sure the script is executable
RUN chmod +x /wordpress.sh

# Set working directory to WordPress directory
WORKDIR /var/www/wordpress

# Run the script at container startup
ENTRYPOINT ["/wordpress.sh"]
