# 使用 PHP 7.2 CLI 版本
FROM php:7.2-cli

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libssl-dev libcurl4-openssl-dev unzip git \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install sockets pdo_mysql mysqli gd bcmath \
    && pecl install swoole-4.5.11 redis-5.3.7 \
    && docker-php-ext-enable swoole redis

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 安装 Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 设置工作目录
WORKDIR /var/www/html

# 复制 entrypoint.sh 并赋予执行权限
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 容器启动时执行 entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]