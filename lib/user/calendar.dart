import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class calendar extends StatefulWidget {
  const calendar({Key? key}) : super(key: key);

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  DateTime myDateTime = DateTime.now();
  var formatterm = DateFormat.MMMM("th");
  var formatterD = DateFormat.d("th");
  var formatterE = DateFormat.EEEE("th");
  var formatterUS = DateFormat("EEEE, d, MMMM, y");

  void _showDatePicker() async {
    DateTime? newDateTime = await showRoundedDatePicker(
      context: context,
      theme: ThemeData(primarySwatch: Colors.amber),
      styleDatePicker: MaterialRoundedDatePickerStyle(
        textStyleDayHeader: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        textStyleCurrentDayOnCalendar: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold),
        textStyleDayOnCalendar:
            TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
        textStyleDayOnCalendarSelected: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold),
        textStyleDayOnCalendarDisabled: TextStyle(
            fontSize: 18, color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1)),
        textStyleMonthYearHeader: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold),
      ),
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year + 50),
      locale: Locale("th", "TH"),
      era: EraMode.BUDDHIST_YEAR,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 197, 197),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'ปฏิทิน',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${formatterE.format(myDateTime)}ที่ ${formatterD.format(myDateTime)} เดือน${formatterm.format(myDateTime)} พ.ศ. ${myDateTime.year + 543}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${formatterUS.format(myDateTime)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  alignment: Alignment.center,
                  minimumSize: MaterialStateProperty.all(const Size(250, 50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  _showDatePicker();
                },
                icon: Icon(
                  Icons.calendar_month,
                  size: 24.0,
                ),
                label: Text(
                  'ดูปฏิทิน',
                  style: TextStyle(fontSize: 20),
                ), // <-- Text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
