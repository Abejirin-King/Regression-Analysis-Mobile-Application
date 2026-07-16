# EduPredict AI - Student Academic Performance Prediction

## Mission and Problem Statement

EduPredict AI supports the mission of providing education to young students without removing the fun in learning. The project predicts student academic performance using learning habits, academic history, and lifestyle factors. This helps identify factors affecting student outcomes and supports personalized educational interventions.

---

# Project Overview

EduPredict AI is a machine learning application that predicts student exam performance using a multivariate linear regression model.

The project combines:

- Machine learning model development using Scikit-learn
- Data preprocessing and feature engineering
- Regression algorithm comparison
- FastAPI backend deployment
- Flutter mobile application integration

The goal is to help educators and students understand factors that influence academic performance while supporting a more personalized learning experience.

---

# Machine Learning Pipeline

The machine learning workflow includes:

- Dataset exploration and visualization
- Data cleaning and analysis
- Feature selection and engineering
- Conversion of categorical variables into numerical representations
- Feature standardization
- Training multiple regression algorithms
- Model evaluation and comparison
- Saving the best-performing model for deployment

The regression algorithms compared were:

- Linear Regression
- Ridge Regression
- Stochastic Gradient Descent Regression (SGDRegressor)

---

# Dataset

The model was trained using the Kaggle:

**Student Habits and Academic Performance Dataset**

The dataset contains student academic, behavioral, and lifestyle information.

The target variable:

```
exam_score
```

Important features used by the model include:

- Age
- Gender
- Major
- Study hours per day
- Attendance percentage
- Sleep hours
- Part-time job status
- Previous GPA
- Stress level
- Access to tutoring
- Exam anxiety score
- Time management score

---

# Model Performance

The models were evaluated using:

- Mean Absolute Error (MAE)
- Mean Squared Error (MSE)
- Root Mean Squared Error (RMSE)
- R² Score


| Model | MAE | MSE | RMSE | R² Score |
|---|---|---|---|---|
| Linear Regression | 3.196905 | 17.549635 | 4.189228 | 0.870376 |
| Ridge Regression | 3.196925 | 17.549648 | 4.189230 | 0.870376 |
| SGD Regression | 3.248867 | 17.965636 | 4.238589 | 0.867303 |


The best-performing model was saved and used for API deployment.

---

# API Documentation

The trained model is deployed using FastAPI.

The public API endpoint can be accessed through Swagger UI:

```
https://regression-analysis-mobile-application.onrender.com/docs
```

The Swagger interface allows testing of the prediction endpoint.

---

# Prediction Endpoint

## POST `/predict`

This endpoint receives student information and returns a predicted exam score.

Example request:

```json
{
  "age": 21,
  "gender": "Male",
  "major": "Computer Science",
  "study_hours_per_day": 5.5,
  "attendance_percentage": 85,
  "sleep_hours": 7,
  "part_time_job": "No",
  "previous_gpa": 3.5,
  "stress_level": 4,
  "access_to_tutoring": "Yes",
  "exam_anxiety_score": 3,
  "time_management_score": 8
}
```

Example response:

```json
{
  "predicted_exam_score": 86.65
}
```

---

# Running the API Locally

## Requirements

- Python
- uv package manager


Create the virtual environment:

```bash
uv venv
```

Activate the environment.

For Git Bash:

```bash
source .venv/Scripts/activate
```

Install project dependencies:

```bash
uv sync
```

Run FastAPI:

```bash
uvicorn summative.API.main:app --reload
```

Open Swagger UI:

```
http://127.0.0.1:8000/docs
```

---

# Mobile Application Setup

The mobile application was developed using Flutter.

## Requirements

Install:

- Flutter SDK
- Dart SDK
- Android Studio or Android emulator


Navigate to the Flutter application folder:

```bash
cd FlutterApp
```

Install Flutter dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

# Mobile Application Features

The application provides:

- Student performance prediction page
- Input fields matching the API requirements
- Prediction button
- Prediction result display
- Error handling for invalid inputs
- Reset functionality for making new predictions

The application communicates with the deployed FastAPI backend to generate predictions.

---

# CORS Configuration

Cross-Origin Resource Sharing (CORS) allows applications hosted on different domains to communicate with the API.

The API uses CORS middleware to control which applications can access the prediction service.

During development:

```python
allow_origins=["*"]
```

is used to allow requests from any origin. This makes testing easier with:

- Swagger UI
- Flutter application


## Allowed

- Flutter application requests
- Swagger UI testing


## Restricted

In production, unrestricted access should be replaced with trusted frontend domains only.

Restrictions include:

- Unknown websites
- Unauthorized third-party applications

This reduces unauthorized access to the API.

---

# Project Structure

```
linear_regression_model/

├── summative/

│   ├── linear_regression/

│   │   ├── multivariate.ipynb
│   │   ├── models/
│   │       ├── best_model.pkl
│   │       ├── scaler.pkl
│   │       └── preprocessor.pkl

│   ├── API/

│   │   ├── main.py
│   │   ├── prediction.py
│   │   ├── schemas.py
│   │   └── test_prediction.py

│   ├── FlutterApp/

├── pyproject.toml

├── uv.lock

└── README.md
```

---

# Development Note

To avoid conflicts when working with Git, always pull the latest changes before starting development:

```bash
git pull origin main
```

Commit changes regularly with clear messages describing the completed work.

Example:

```bash
git add .
git commit -m "Describe completed feature"
git push origin main
```