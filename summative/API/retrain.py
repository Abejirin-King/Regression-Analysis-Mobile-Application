from pathlib import Path

import joblib
import pandas as pd

from sklearn.compose import ColumnTransformer
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import OneHotEncoder, StandardScaler


BASE_DIR = Path(__file__).resolve().parent.parent

MODEL_DIR = BASE_DIR / "linear_regression" / "models"


def retrain_model(df: pd.DataFrame):
    """
    Retrain the regression model using a new dataset.
    """

    # Remove unnecessary columns if present
    columns_to_drop = [
        "student_id",
        "dropout_risk"
    ]

    df = df.drop(
        columns=columns_to_drop,
        errors="ignore"
    )

    X = df.drop(columns=["exam_score"])
    y = df["exam_score"]

    categorical = X.select_dtypes(include=["object"]).columns

    preprocessor = ColumnTransformer(
        transformers=[
            (
                "categorical",
                OneHotEncoder(
                    drop="first",
                    handle_unknown="ignore"
                ),
                categorical,
            )
        ],
        remainder="passthrough",
    )

    X = preprocessor.fit_transform(X)

    scaler = StandardScaler()

    X = scaler.fit_transform(X)

    model = LinearRegression()

    model.fit(X, y)

    joblib.dump(model, MODEL_DIR / "best_model.pkl")
    joblib.dump(scaler, MODEL_DIR / "scaler.pkl")
    joblib.dump(preprocessor, MODEL_DIR / "preprocessor.pkl")

    return {
        "message": "Model retrained successfully."
    }