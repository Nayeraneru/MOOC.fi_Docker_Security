FROM docker:latest

WORKDIR /app

COPY builder.sh .

RUN chmod +x builder.sh

ENTRYPOINT ["./builder.sh"]
