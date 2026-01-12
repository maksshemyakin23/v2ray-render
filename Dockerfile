FROM alpine:latest
RUN apk add --no-cache curl unzip
RUN curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.7.0/v2ray-linux-64.zip
RUN unzip v2ray.zip && chmod +x v2ray
COPY config.json /etc/v2ray/
EXPOSE 8080
CMD ["./v2ray", "run", "-config", "/etc/v2ray/config.json"]
