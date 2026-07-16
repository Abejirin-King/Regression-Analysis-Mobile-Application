import 'package:flutter/material.dart';
import '../services/api_service.dart';

const Color primaryBlue = Color(0xff219EBC);
const Color accentAmber = Color(0xffffb703);
const Color softCream = Color(0xffFAFAFA);

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


  @override
  void dispose() {
    ageController.dispose();
    studyHoursController.dispose();
    attendanceController.dispose();
    sleepController.dispose();
    gpaController.dispose();
    stressController.dispose();
    anxietyController.dispose();
    timeManagementController.dispose();
    super.dispose();
  }


  void resetForm() {

    ageController.clear();
    studyHoursController.clear();
    attendanceController.clear();
    sleepController.clear();
    gpaController.clear();
    stressController.clear();
    anxietyController.clear();
    timeManagementController.clear();
    setState(() {
      gender = "Male";
      major = "Computer Science";
      partTimeJob = "No";
      tutoring = "Yes";
      result = "";
    });

  }


  Future<void> predict() async {

    FocusScope.of(context).unfocus();

    if([
      ageController,
      studyHoursController,
      attendanceController,
      sleepController,
      gpaController,
      stressController,
      anxietyController,
      timeManagementController
    ].any((controller) => controller.text.isEmpty)) {

      setState(() {
        result = "Please complete all fields.";
      });

      return;
    }

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

        "part_time_job": partTimeJob,

        "previous_gpa":
        double.parse(gpaController.text),

        "stress_level":
        double.parse(stressController.text),

        "access_to_tutoring": tutoring,

        "exam_anxiety_score":
        int.parse(anxietyController.text),

        "time_management_score":
        double.parse(timeManagementController.text),

      };

      final prediction =
      await ApiService.predictExamScore(data);

      setState(() {
        result =
        "${prediction.toStringAsFixed(2)}%";
      });


    } catch(e) {
      setState(() {
        result = "Invalid input values.";
      });
    }
    setState(() {
      loading = false;
    });
  }



  Widget inputField(
      String label,
      TextEditingController controller
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom:12),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color(0xffF3F7F8),
          prefixIcon:
          const Icon(
            Icons.edit_note,
            color: primaryBlue,
          ),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget dropdown(
      String label,
      String value,
      List<String> items,
      Function(String?) onChanged
      ) {

    return Padding(
      padding:
      const EdgeInsets.only(bottom:12),
      child:
      DropdownButtonFormField<String>(
        initialValue:value,
        decoration: InputDecoration(
          labelText:label,
          filled:true,
          fillColor:
          const Color(0xffF3F7F8),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(14),
            borderSide:
            BorderSide.none,
          ),
        ),

        items:
        items.map((item){
          return DropdownMenuItem(
            value:item,
            child:Text(item),
          );
        }).toList(),
        onChanged:onChanged,
      ),
    );
  }

  Widget sectionTitle(String title){
    return Align(
      alignment:
      Alignment.centerLeft,
      child:
      Padding(
        padding:
        const EdgeInsets.only(bottom:10,top:5),
        child:
        Text(
          title,
          style:
          const TextStyle(
            fontSize:18,
            fontWeight:
            FontWeight.bold,
            color:primaryBlue,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:softCream,
      appBar:AppBar(
        backgroundColor:primaryBlue,
        centerTitle:true,
        elevation:0,
        title:
        const Text(
          "AI Predict Education",
          style:
          TextStyle(
            color:Colors.white,
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),
      body:
      SingleChildScrollView(
        padding:
        const EdgeInsets.all(16),
        child:
        Column(
          children:[
            Card(
              color:
              Colors.white,
              elevation:3,
              shape:
              RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20),
              ),
              child:
              Padding(
                padding:
                const EdgeInsets.all(18),
                child:
                Column(
                  children:[
                    const Icon(
                      Icons.school,
                      size:55,
                      color:primaryBlue,
                    ),
                    const SizedBox(height:8),
                    const Text(
                      "Student Performance Predictor",
                      textAlign:
                      TextAlign.center,
                      style:
                      TextStyle(
                        fontSize:22,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Estimate exam performance using learning habits.",
                      textAlign:
                      TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height:16),
            Card(
              color:
              Colors.white,
              elevation:2,
              shape:
              RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20),
              ),
              child:
              Padding(
                padding:
                const EdgeInsets.all(18),
                child:
                Column(
                  children:[
                    sectionTitle(
                        "Student Information"
                    ),

                    inputField(
                        "Age",
                        ageController
                    ),

                    dropdown(
                        "Gender",
                        gender,
                        ["Male","Female","Other"],
                            (v)=>setState(()=>gender=v!)
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
                            (v)=>setState(()=>major=v!)
                    ),
                    sectionTitle(
                        "Learning Habits"
                    ),

                    inputField(
                        "Study Hours Per Day",
                        studyHoursController
                    ),

                    inputField(
                        "Attendance Percentage",
                        attendanceController
                    ),

                    inputField(
                        "Sleep Hours",
                        sleepController
                    ),

                    dropdown(
                        "Part Time Job",
                        partTimeJob,
                        ["Yes","No"],
                            (v)=>setState(()=>partTimeJob=v!)
                    ),

                    inputField(
                        "Previous GPA",
                        gpaController
                    ),

                    inputField(
                        "Stress Level",
                        stressController
                    ),

                    dropdown(
                        "Access To Tutoring",
                        tutoring,
                        ["Yes","No"],
                            (v)=>setState(()=>tutoring=v!)
                    ),

                    inputField(
                        "Exam Anxiety Score",
                        anxietyController
                    ),

                    inputField(
                        "Time Management Score",
                        timeManagementController
                    ),
                    const SizedBox(height:10),
                    Row(
                      children:[
                        Expanded(
                          child:
                          ElevatedButton(
                            onPressed:
                            loading ? null : predict,
                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              accentAmber,
                              foregroundColor:
                              Colors.black,
                              minimumSize:
                              const Size(0,50),
                            ),
                            child:
                            loading
                                ?
                            const CircularProgressIndicator()
                                :
                            const Text("Predict"),
                          ),
                        ),
                        const SizedBox(width:10),
                        Expanded(
                          child:
                          OutlinedButton(
                            onPressed:
                            loading ? null : resetForm,
                            style:
                            OutlinedButton.styleFrom(
                              foregroundColor:
                              primaryBlue,
                              minimumSize:
                              const Size(0,50),
                            ),
                            child:
                            const Text("Reset"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if(result.isNotEmpty)
              Card(
                margin:
                const EdgeInsets.only(top:16),
                color:
                accentAmber.withValues(alpha: 0.15),
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                child:
                Padding(
                  padding:
                  const EdgeInsets.all(25),
                  child:
                  Text(
                    "Predicted Exam Score\n\n$result",
                    textAlign:
                    TextAlign.center,
                    style:
                    const TextStyle(
                      fontSize:22,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}