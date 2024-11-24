FROM python:3.9-slim

WORKDIR /app

RUN apt update && apt install -y --no-install-recommends \
        curl iproute2 && \
    useradd -m appuser && \
    pip install flask && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    chown -R appuser:appuser /app

COPY app.py /app

USER appuser

CMD ["python", "app.py"]

