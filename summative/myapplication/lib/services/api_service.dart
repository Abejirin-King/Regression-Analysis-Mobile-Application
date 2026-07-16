import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {

  static const String baseUrl =
      "https://regression-analysis-mobile-application.onrender.com";


  static Future<double> predictExamScore(
      Map<String, dynamic> studentData) async {

    final response = await http.post(
      Uri.parse("$baseUrl/predict"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(studentData),
    );


    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return data["predicted_exam_score"];

    } else {

      final error = jsonDecode(response.body);

      throw Exception(
        error["detail"] ?? "Prediction failed",
      );
    }
  }
}