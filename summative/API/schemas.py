from pydantic import BaseModel, Field


class StudentData(BaseModel):
    age: int = Field(..., ge=15, le=40)
    gender: str
    major: str
    study_hours_per_day: float = Field(..., ge=0, le=24)
    social_media_hours: float = Field(..., ge=0, le=24)
    netflix_hours: float = Field(..., ge=0, le=24)
    part_time_job: str
    attendance_percentage: float = Field(..., ge=0, le=100)
    sleep_hours: float = Field(..., ge=0, le=24)
    diet_quality: str
    exercise_frequency: int = Field(..., ge=0, le=7)
    parental_education_level: str
    internet_quality: str
    mental_health_rating: float = Field(..., ge=0, le=10)
    extracurricular_participation: str
    previous_gpa: float = Field(..., ge=0, le=4)
    semester: int = Field(..., ge=1, le=8)
    stress_level: float = Field(..., ge=0, le=10)
    social_activity: int = Field(..., ge=0, le=10)
    screen_time: float = Field(..., ge=0, le=24)
    study_environment: str
    access_to_tutoring: str
    family_income_range: str
    parental_support_level: int = Field(..., ge=1, le=10)
    motivation_level: int = Field(..., ge=1, le=10)
    exam_anxiety_score: int = Field(..., ge=0, le=10)
    learning_style: str
    time_management_score: float = Field(..., ge=0, le=10)