FROM alpine:3.18

# Установка V2Ray
RUN wget -O v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.7.0/v2ray-linux-64.zip && \
    unzip v2ray.zip && \
    chmod +x v2ray && \
    rm v2ray.zip geoip.dat geosite.dat

# Копирование конфига
COPY config.json /etc/v2ray/config.json

# Порт
EXPOSE 8080

# Запуск
CMD ["./v2ray", "run", "-config", "/etc/v2ray/config.json"]
