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


# redis configuration
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

/usr/sbin/php-fpm7.4 --nodaemonize