from pydantic import BaseModel, Field


class StudentData(BaseModel):
    age: int = Field(..., ge=15, le=40)
    gender: str
    major: str
    study_hours_per_day: float = Field(..., ge=0, le=24)
    attendance_percentage: float = Field(..., ge=0, le=100)
    sleep_hours: float = Field(..., ge=0, le=24)
    part_time_job: str
    previous_gpa: float = Field(..., ge=0, le=4)
    stress_level: float = Field(..., ge=0, le=10)
    access_to_tutoring: str
    exam_anxiety_score: int = Field(..., ge=0, le=10)
    time_management_score: float = Field(..., ge=0, le=10)