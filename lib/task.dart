import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextFormField(
                controller: startDate,
                readOnly: true,
                onTap: () {
                  showDatePicker(context: context,
                      initialDate: startTime,
                      firstDate: DateTime(1999),
                      lastDate: DateTime(2030)).then((value) {
                    startDate.text = value.toString();
                    startTime = value ?? DateTime.now();
                    endTime = value ?? startTime.add(Duration(days:1));
                    setState(() {

                    });
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),

                ),
              ),
              SizedBox(height: 60,),
              TextFormField(
                readOnly: true,
                controller: endDate,
                onTap: () {
                  showDatePicker(context: context,
                      initialDate: endTime,
                      firstDate: startTime,
                      lastDate: DateTime(2030)).then((value){
                        endDate.text = value.toString();
                        endTime = value ?? startTime.add(Duration(days:1));
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
