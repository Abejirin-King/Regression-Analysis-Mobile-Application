import 'package:flutter/material.dart';
import '../services/api_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final ageController = TextEditingController();
  final studyHoursController = TextEditingController();
  final attendanceController = TextEditingController();
  final sleepController = TextEditingController();
  final gpaController = TextEditingController();
  final stressController = TextEditingController();
  final anxietyController = TextEditingController();
  final timeManagementController = TextEditingController();


  String gender = "Male";
  String major = "Computer Science";
  String partTimeJob = "No";
  String tutoring = "Yes";


  String result = "";
  bool loading = false;


  Future<void> predict() async {

    setState(() {
      loading = true;
      result = "";
    });


    try {

      final data = {

        "age": int.parse(ageController.text),

        "gender": gender,

        "major": major,

        "study_hours_per_day":
            double.parse(studyHoursController.text),

        "attendance_percentage":
            double.parse(attendanceController.text),

        "sleep_hours":
            double.parse(sleepController.text),

        "part_time_job":
            partTimeJob,

        "previous_gpa":
            double.parse(gpaController.text),

        "stress_level":
            double.parse(stressController.text),

        "access_to_tutoring":
            tutoring,

        "exam_anxiety_score":
            int.parse(anxietyController.text),

        "time_management_score":
            double.parse(timeManagementController.text),

      };


      final prediction =
          await ApiService.predictExamScore(data);


      setState(() {
        result =
            "Predicted Exam Score: ${prediction.toStringAsFixed(2)}";
      });


    } catch (e) {

      setState(() {
        result = "Error: ${e.toString()}";
      });

    }


    setState(() {
      loading = false;
    });

  }


  Widget inputField(
      String label,
      TextEditingController controller) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }


  Widget dropdown(
      String label,
      String value,
      List<String> items,
      Function(String?) onChanged) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: DropdownButtonFormField<String>(
        value: value,

        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),

        items: items.map((item) {

          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );

        }).toList(),

        onChanged: onChanged,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Student Performance Predictor",
        ),
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),


        child: Column(

          children: [

            inputField(
              "Age",
              ageController,
            ),


            dropdown(
              "Gender",
              gender,
              [
                "Male",
                "Female",
                "Other"
              ],
              (value){
                setState(() {
                  gender=value!;
                });
              },
            ),


            dropdown(
              "Major",
              major,
              [
                "Computer Science",
                "Arts",
                "Business",
                "Psychology"
              ],
              (value){
                setState(() {
                  major=value!;
                });
              },
            ),


            inputField(
              "Study Hours Per Day",
              studyHoursController,
            ),


            inputField(
              "Attendance Percentage",
              attendanceController,
            ),


            inputField(
              "Sleep Hours",
              sleepController,
            ),


            dropdown(
              "Part Time Job",
              partTimeJob,
              [
                "Yes",
                "No"
              ],
              (value){
                setState(() {
                  partTimeJob=value!;
                });
              },
            ),


            inputField(
              "Previous GPA",
              gpaController,
            ),


            inputField(
              "Stress Level (0-10)",
              stressController,
            ),


            dropdown(
              "Access To Tutoring",
              tutoring,
              [
                "Yes",
                "No"
              ],
              (value){
                setState(() {
                  tutoring=value!;
                });
              },
            ),


            inputField(
              "Exam Anxiety Score (0-5)",
              anxietyController,
            ),


            inputField(
              "Time Management Score (0-10)",
              timeManagementController,
            ),


            const SizedBox(height: 20),


            ElevatedButton(

              onPressed:
                  loading ? null : predict,

              child:

              loading
              ? const CircularProgressIndicator()
              : const Text("Predict"),

            ),


            const SizedBox(height:20),


            Text(
              result,
              style: const TextStyle(
                fontSize:18,
                fontWeight:FontWeight.bold,
              ),
            )

          ],

        ),

      ),

    );

  }

}