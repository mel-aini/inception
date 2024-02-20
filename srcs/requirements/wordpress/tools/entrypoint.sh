# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
# chmod +x wp-cli.phar 
# mv wp-cli.phar /usr/local/bin/wp

# for testing
# apt install -y iproute2
while true; do
    ping -c 1 mariadb

    if [ $? -eq 0 ]; then
        echo "Mariadb ping successful. Breaking out of the loop."
        break
    else
        echo "Mariadb ping failed. Retrying..."
        sleep 1  # Wait for 1 second before the next ping attempt
    fi
done

wp core download --allow-root
# Generate the wp-config.php file with our database details.
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root

# install wordpress
wp core install --url=$MYSITE_URL --title=$MYSITE_TITLE --admin_user=$MYSITE_ADMIN_USERNAME --admin_password=$MYSITE_ADMIN_PASSWORD --admin_email=$MYSITE_ADMIN_EMAIL --allow-root
wp user create normal_user normal_use@example.com --role=author --user_pass=123 --allow-root
# sed -i "s/daemonize = yes/daemonize = no/" /etc/php/7.4/fpm/php-fpm.conf

# mkdir -p /run/php

# chown -R root:root /var/www/inception

while true; do
    ping -c 1 redis

    if [ $? -eq 0 ]; then
        echo "Redis ping successful. Breaking out of the loop."
        break
    else
        echo "Redis ping failed. Retrying..."
        sleep 1  # Wait for 1 second before the next ping attempt
    fi
done

wp config set WP_REDIS_HOST 'redis' --type=constant --allow-root
wp config set WP_REDIS_PORT '6379' --type=constant --allow-root
wp config set WP_CACHE_KEY_SALT 'my-prefix:' --type=constant --allow-root


# title: redis configuration
# cd /var/www/inception/wp-content/plugins
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root



# while true; do
#     ping -c 1 ftp

#     if [ $? -eq 0 ]; then
#         echo "Ftp ping successful. Breaking out of the loop."
#         break
#     else
#         echo "Ftp ping failed. Retrying..."
#         sleep 1  # Wait for 1 second before the next ping attempt
#     fi
# done

# # title: fto configuration
# wp config set FS_METHOD 'ftpext' --type=constant --allow-root
# wp config set FTP_BASE '/' --type=constant --allow-root
# wp config set FTP_CONTENT_DIR '/wp-content/' --type=constant --allow-root
# wp config set FTP_PLUGIN_DIR  '/wp-content/plugins/' --type=constant --allow-root
# wp config set FTP_USER 'newuser' --type=constant --allow-root
# wp config set FTP_PASS '123' --type=constant --allow-root
# wp config set FTP_HOST 'ftp://ftp:21' --type=constant --allow-root
# wp config set FTP_SSL 'false' --type=constant --allow-root

/usr/sbin/php-fpm7.4 --nodaemonize
# sleep infinity

# ##### helpfull tools ######
# docker build -t wordpress .
# --no-cache
# docker run -d --name wordpress1 wordpress
# docker exec -it wordpress1 bash
# docker container stop wordpress1 && docker container rm wordpress1