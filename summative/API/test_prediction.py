from prediction import predict_exam_score

sample_student = {
    "age": 21,
    "gender": "Male",
    "major": "Computer Science",
    "study_hours_per_day": 5,
    "social_media_hours": 2,
    "netflix_hours": 1,
    "part_time_job": "No",
    "attendance_percentage": 90,
    "sleep_hours": 7,
    "diet_quality": "Good",
    "exercise_frequency": 3,
    "parental_education_level": "Bachelor",
    "internet_quality": "High",
    "mental_health_rating": 8,
    "extracurricular_participation": "Yes",
    "previous_gpa": 3.7,
    "semester": 5,
    "stress_level": 4,
    "social_activity": 2,
    "screen_time": 6,
    "study_environment": "Library",
    "access_to_tutoring": "Yes",
    "family_income_range": "Medium",
    "parental_support_level": 8,
    "motivation_level": 8,
    "exam_anxiety_score": 5,
    "learning_style": "Reading",
    "time_management_score": 8
}

prediction = predict_exam_score(sample_student)

print(f"Predicted Exam Score: {prediction:.2f}")