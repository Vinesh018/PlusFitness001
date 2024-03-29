import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

var width;

class DatepickerCustom extends StatefulWidget {
  const DatepickerCustom({super.key});

  @override
  State<DatepickerCustom> createState() => _DatepickerCustomState();
}

class _DatepickerCustomState extends State<DatepickerCustom> {
  var dateValue = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    DateTime now1 = DateTime.now();
    DateTime dateOnly = DateTime(now1.year, now1.month, now1.day);

    if (dateOnly.day > 9) {
      width = 10.0;
    } else {
      width = 0.0;
      print('Below nine');
    }
  }

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return selectedDate;
      }
      setState(() {
        selectedDate = pickedDate;
        //  print(selectedDate);
        // dateValue.text = "${selectedDate.toLocal()}".split(' ')[0];
        dateValue.text = DateFormat('d ').format(selectedDate) +
            DateFormat('MMMM').format(selectedDate).trim().substring(0, 3);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onTap: () {
            setState(() {
              selectedDate = selectedDate.add(const Duration(days: -1));
              dateValue.text = dateValue.text =
                  DateFormat('d ').format(selectedDate) +
                      DateFormat('MMMM')
                          .format(selectedDate)
                          .trim()
                          .substring(0, 3);
            });
          },
        ),
        SizedBox(
          width: 100,
          child: GestureDetector(
            child: TextFormField(
              controller: dateValue,
              readOnly: true,
              onTap: () {
                _selectDate();
                // print(dateValue);
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                    ),
                  ),
                  hintText: dateValue.text =
                      DateFormat('d ').format(selectedDate) +
                          DateFormat('MMMM')
                              .format(selectedDate)
                              .trim()
                              .substring(0, 3),
                  hintStyle: const TextStyle(
                      fontFamily: 'FontMain', fontWeight: FontWeight.w500)),
            ),
          ),
        ),
        SizedBox(
          width: width,
        ),
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          onTap: () {
            setState(() {
              DateTime t1 = selectedDate;
              DateTime now = DateTime.now();
              DateTime dateOnly = DateTime(now.year, now.month, now.day);
              if (t1.isBefore(dateOnly)) {
                selectedDate = selectedDate.add(const Duration(days: 1));
                dateValue.text = DateFormat('d ').format(selectedDate) +
                    DateFormat('MMMM')
                        .format(selectedDate)
                        .trim()
                        .substring(0, 3);
                print(dateOnly.day.runtimeType);
              }
            });
          },
        ),
      ],
    );
  }
}
