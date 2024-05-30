FROM debian:12.5-slim

EXPOSE 3000
ENTRYPOINT ["./build-bunny" ]
CMD [ "daemon" ]
WORKDIR /app

RUN apt-get update && apt-get install -y git libmojolicious-perl libminion-backend-sqlite-perl libemail-sender-perl  libemail-mime-perl && rm -rf /var/lib/apt/lists/*

COPY . .

USER nobody
