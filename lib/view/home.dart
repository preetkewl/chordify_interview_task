import 'package:chordify_interview_task/utils/loading_indicator_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Calendar'),
      ),
      body: Obx(
        ()=> LoadingIndicatorPage(
          loading: controller.loading,

          child: TableCalendar(

            headerStyle: const HeaderStyle(titleCentered: true),
              firstDay: DateTime.utc(2023, 01, 01),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              weekNumbersVisible: false,
       onFormatChanged: (format) {

              },

              calendarBuilders: CalendarBuilders(


                defaultBuilder:(context, date, events) {

                  String x = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                    return Obx(
                      ()=> Container(
                        margin: const EdgeInsets.all(2.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(4.0),                          color: controller.colorMap[x] ?? Colors.transparent,
                          shape: BoxShape.rectangle,
                        ),
                        child: Text(
                          date.day.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
        ),
      ),




    );
  }
}