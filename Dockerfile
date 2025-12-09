FROM python:3.11-slim

LABEL maintainer="vilsinegin@gmail.com"
LABEL description="SecureCI - Secure Dockerized Python Application"

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        netbase \
        tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*	
RUN rm -rf /var/cache/apt/*

COPY app/ .

RUN pip install --no-cache-dir -r requirements.txt

RUN adduser --disabled-password --gecos "" appuser

USER appuser

HEALTHCHECK --interval=30s --timeout=10s \
    CMD curl -f http://localhost:5000/ || exit 1

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
