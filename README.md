# EduPredict AI – Student Academic Performance Prediction

## Mission and Problem Statement

**Mission:** Develop an AI-powered academic support system that predicts students' final examination scores based on their study habits, attendance, academic history, and lifestyle factors. The system enables educators and academic mentors to identify students who may require early intervention, allowing personalized support before final examinations.

Student performance is influenced by multiple factors beyond classroom instruction. Study habits, attendance, previous academic achievement, sleep patterns, stress levels, and access to tutoring all contribute to examination outcomes. By accurately predicting exam scores, educational institutions can better understand these relationships and make data-driven decisions to improve student success.

---

# Project Overview

EduPredict AI is a machine learning application that predicts student examination scores using regression algorithms implemented with Scikit-learn.

The project combines:

- Data exploration and visualization
- Feature engineering and preprocessing
- Multiple regression model comparison
- Gradient descent optimization
- FastAPI model deployment
- Flutter mobile application integration

The objective is to build a complete machine learning pipeline from dataset preparation through deployment as a REST API and mobile application.

**YouTube Walkthrough:**

*(Insert your video link here.)*

---

# Dataset

**Dataset Name**

Student Habits and Academic Performance Dataset

**Source**

https://www.kaggle.com/datasets/aryan208/student-habits-and-academic-performance-dataset

### Dataset Description

The dataset contains academic, behavioural, demographic, and lifestyle information collected from students. It includes factors such as attendance, study time, previous academic performance, sleep habits, stress levels, tutoring access, and learning preferences.

The dataset is suitable for regression analysis because the target variable (`exam_score`) is continuous.

### Target Variable

```
exam_score
```

### Features Used

- Age
- Gender
- Major
- Study Hours Per Day
- Attendance Percentage
- Sleep Hours
- Part-Time Job
- Previous GPA
- Stress Level
- Access to Tutoring
- Exam Anxiety Score
- Time Management Score

---

# Exploratory Data Analysis

Several visualizations were created to better understand the dataset before model training.

The notebook includes:

- Distribution of student exam scores
- Correlation heatmap of numerical features
- Study Hours vs Exam Score scatter plot
- Attendance Percentage vs Exam Score scatter plot
- Previous GPA vs Exam Score scatter plot
- Exam Score by Learning Style boxplot

These visualizations were used to identify influential variables and guide feature engineering decisions.

---

# Feature Engineering

Before training the regression models, several preprocessing steps were performed.

These include:

- Removal of duplicate records
- Removal of irrelevant columns (`student_id` and `dropout_risk`)
- Selection of relevant predictive features
- One-Hot Encoding of categorical variables
- Standardization of numerical features using `StandardScaler`
- Splitting the dataset into training and testing sets (80/20)

These preprocessing steps improve model performance and ensure compatibility with machine learning algorithms.

---

# Machine Learning Models

Four regression algorithms were implemented and compared.

- Linear Regression
- Decision Tree Regressor
- Random Forest Regressor
- Stochastic Gradient Descent Regressor (SGDRegressor)

The SGDRegressor was further optimized using different learning-rate strategies and regularization values to satisfy the gradient descent optimization requirement.

---

# Model Evaluation

The following evaluation metrics were used:

- Mean Absolute Error (MAE)
- Mean Squared Error (MSE)
- Root Mean Squared Error (RMSE)
- R² Score

| Model | MAE | MSE | RMSE | R² Score |
|------|------:|------:|------:|------:|
| Linear Regression | *(Update from notebook)* | *(Update)* | *(Update)* | *(Update)* |
| Decision Tree | *(Update from notebook)* | *(Update)* | *(Update)* | *(Update)* |
| Random Forest | *(Update from notebook)* | *(Update)* | *(Update)* | *(Update)* |
| SGD Regression | *(Update from notebook)* | *(Update)* | *(Update)* | *(Update)* |

The model with the highest R² score and lowest prediction error was automatically selected and saved for deployment.

---

# Gradient Descent Optimization

The SGDRegressor model was optimized by experimenting with multiple learning-rate strategies:

- Constant
- Optimal
- Adaptive

Different regularization values (`alpha`) were also evaluated to identify the best-performing configuration.

Training and testing loss curves were plotted across multiple epochs to visualize convergence during gradient descent.

---

# Model Persistence

The following files are saved after training:

```
best_model.pkl
scaler.pkl
preprocessor.pkl
```

These files are loaded by the FastAPI application to generate predictions without retraining the model.

---

# API Documentation

The trained model is deployed using FastAPI.

Swagger Documentation:

```
https://regression-analysis-mobile-application.onrender.com/docs
```

*(Replace with your deployed URL if different.)*

---

# API Endpoints

## POST `/predict`

Predicts a student's examination score.

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

## POST `/retrain`

Retrains the machine learning model using the latest available dataset.

This endpoint allows the deployed model to be updated whenever new student data becomes available without manually rebuilding the project.

---

# CORS Configuration

The API implements FastAPI's `CORSMiddleware` to control which applications are allowed to access the prediction service.

### Allowed

Only trusted frontend applications should be permitted, for example:

- Flutter mobile application
- Local development server
- Swagger UI

Allowed methods include:

- GET
- POST

Allowed headers include:

- Content-Type
- Authorization

Credentials are enabled only for trusted origins.

### Restricted

Unknown websites and unauthorized third-party applications are denied browser-based access.

Using specific trusted origins instead of `allow_origins=["*"]` improves API security and reduces the risk of unauthorized cross-origin requests.

---

# Running the API Locally

## Requirements

- Python 3.11+
- uv package manager

Create a virtual environment:

```bash
uv venv
```

Activate it.

Git Bash:

```bash
source .venv/Scripts/activate
```

Install dependencies:

```bash
uv sync
```

Run the server:

```bash
uvicorn summative.API.main:app --reload
```

Open Swagger UI:

```
http://127.0.0.1:8000/docs
```

---

# Flutter Mobile Application

The Flutter application consumes the deployed FastAPI prediction endpoint.

Features include:

- Input fields for all prediction variables
- Predict button
- Display of predicted examination score
- Validation error messages
- Clean single-page interface

Run:

```bash
flutter pub get
flutter run
```

---

# Project Structure

```
linear_regression_model/

├── summative/
│
├── linear_regression/
│   ├── multivariate.ipynb
│   └── models/
│       ├── best_model.pkl
│       ├── scaler.pkl
│       └── preprocessor.pkl
│
├── API/
│   ├── main.py
│   ├── prediction.py
│   ├── schemas.py
│   ├── retrain.py
│   └── test_prediction.py
│
├── FlutterApp/
│
├── pyproject.toml
├── requirements.txt
├── uv.lock
└── README.md
```

---

# Technologies Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- Joblib
- FastAPI
- Pydantic
- Uvicorn
- Flutter
- Dart

---

# Future Improvements

Potential future enhancements include:

- Automatic retraining using streamed student data
- Model versioning
- Hyperparameter tuning using GridSearchCV
- Advanced ensemble regression methods
- Interactive analytics dashboard for educators
- Support for multiple educational institutions