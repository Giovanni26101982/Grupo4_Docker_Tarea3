# BUILD
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requerimientos.txt .
RUN pip install --upgrade pip && pip wheel --no-cache-dir --wheel-dir=/wheels -r requerimientos.txt

# EJECUCION
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /wheels /wheels
RUN pip install --no-cache /wheels/*
COPY app ./app
EXPOSE 8004
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8004"]