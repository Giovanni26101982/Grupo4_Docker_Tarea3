from fastapi import FastAPI
app = FastAPI()
@app.get("/")
def root():
    return {"status": "ok-grupo4", "app": "Aplicación: fastapi-multistage"}