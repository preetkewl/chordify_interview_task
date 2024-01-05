import 'package:chordify_interview_task/models/logs.dart';

import '../globals.dart';
import 'package:http/http.dart' as http;

const webserviceAddress = WebserviceBase;

enum CallType { get, post, put, delete }

class ApiService{

  static var client = http.Client();

  static Future<Logs> getData() async {
    final Uri url = Uri.parse('${webserviceAddress}E7zqDi');
    var response = await client.get(url);
    return logsFromJson(response.body);
  }


}