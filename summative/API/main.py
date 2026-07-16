from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .prediction import predict_exam_score
from .schemas import StudentData

app = FastAPI(
    title="Student Academic Performance Prediction API",
    description="Predicts a student's exam score using a multivariate linear regression model.",
    version="1.0.0",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Restrict this in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def home():
    return {
        "message": "Student Academic Performance Prediction API",
        "docs": "/docs",
    }


@app.post("/predict")
def predict(student: StudentData):
    prediction = predict_exam_score(student.model_dump())

    return {
        "predicted_exam_score": round(prediction, 2)
    }