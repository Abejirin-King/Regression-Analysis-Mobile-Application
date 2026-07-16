from pathlib import Path
import joblib
import pandas as pd

BASE_DIR = Path(__file__).resolve().parent.parent
MODEL_DIR = BASE_DIR / "linear_regression" / "models"


def load_model():
    model = joblib.load(MODEL_DIR / "best_model.pkl")
    scaler = joblib.load(MODEL_DIR / "scaler.pkl")
    preprocessor = joblib.load(MODEL_DIR / "preprocessor.pkl")

    return model, scaler, preprocessor


model, scaler, preprocessor = load_model()


def predict_exam_score(data: dict) -> float:
    df = pd.DataFrame([data])
    transformed = preprocessor.transform(df)
    transformed = scaler.transform(transformed)
    prediction = model.predict(transformed)
    return float(prediction[0])