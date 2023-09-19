// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BankingTab extends StatefulWidget {
  const BankingTab({super.key});

  @override
  State<BankingTab> createState() => _BankingTabState();
}

class _BankingTabState extends State<BankingTab> {
  String selectedDate = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Selected Date: $selectedDate'),
        ElevatedButton(
          onPressed: () async {
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 10)),
              lastDate: DateTime(2025),
            );

            setState(() {
              this.selectedDate = selectedDate?.toIso8601String() ?? '';
            });
          },
          child: const Text('Select Date'),
        ),
        ElevatedButton(
          onPressed: () async {
            TimeOfDay? selectedTime = await showTimePicker(
                context: context, initialTime: TimeOfDay.now());

            setState(() {
              selectedDate = selectedTime?.toString() ?? '';
            });
          },
          child: const Text('Select Time'),
        ),
        ElevatedButton(
          onPressed: () async {
            showCupertinoDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.red,
                        height: 300,
                        child: CupertinoDatePicker(
                          backgroundColor: Colors.white,

                          initialDateTime: DateTime.now(),
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          // This is called when the user changes the time.
                          onDateTimeChanged: (DateTime newTime) {
                            setState(() {
                              selectedDate = newTime.toIso8601String();
                            });
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                });
          },
          child: const Text('Cupertino Date Picker'),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Log out'),
                    content: const Text('Are you shure you want to log out'),
                    actions: [
                      TextButton(
                        onPressed: () {},
                        child: Text('OK'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Cancel'),
                      )
                    ],
                  );
                });
          },
          child: const Text('Show dialog'),
        ),
        ElevatedButton(
          onPressed: () {
            showCupertinoDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text('Log out'),
                    content: Text('Are you shure you want to log out'),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('OK'),
                        isDestructiveAction: true,
                        onPressed: () {},
                      ),
                      CupertinoDialogAction(
                        child: Text('Cancel'),
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
          },
          child: const Text('Show cupertino dialog'),
        ),
      ],
    );
  }
}
