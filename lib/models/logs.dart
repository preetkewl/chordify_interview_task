import 'dart:convert';

Logs logsFromJson(String str) => Logs.fromJson(json.decode(str));

class Logs {
  List<Log> logs;

  Logs({
    required this.logs,
  });

  factory Logs.fromJson(Map<String, dynamic> json) => Logs(
    logs: List<Log>.from(json["logs"].map((x) => Log.fromJson(x))),
  );

}

class Log {
  String date;
  int totalMg;

  Log({
    required this.date,
    required this.totalMg,
  });

  factory Log.fromJson(Map<String, dynamic> json) => Log(
    date: json["date"],
    totalMg: json["totalMg"],
  );

}
