import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerModalBottomWidget extends StatefulWidget {
  const DatePickerModalBottomWidget({super.key});

  @override
  State<DatePickerModalBottomWidget> createState() =>
      _DatePickerModalBottomWidgetState();
}

class _DatePickerModalBottomWidgetState
    extends State<DatePickerModalBottomWidget> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Pick your date!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: const Text('Choose Date'),
            ),
            const SizedBox(height: 20.0),
            selectedDate != null
                ? Text(
                    'Date picked: ${DateFormat('dd-MM-yyyy').format(selectedDate!)}',
                    style: const TextStyle(fontSize: 20.0),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? pickedDate = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: CalendarDatePicker(
                    initialDate: currentDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                    onDateChanged: (date) {
                      Navigator.pop(context, date);
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
