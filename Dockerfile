FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl unzip && mkdir -p /usr/local/bin /etc/xray && curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v1.8.24/Xray-linux-64.zip && unzip /tmp/xray.zip -d /usr/local/bin && chmod +x /usr/local/bin/xray && rm -f /tmp/xray.zip
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
