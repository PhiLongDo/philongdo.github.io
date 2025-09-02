import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:year_month_picker/year_month_picker.dart';

part 'bottom_sheet_preview.dart';

part 'dialog_preview.dart';

class YearMonthPickerPage extends StatefulWidget {
  const YearMonthPickerPage({super.key});

  @override
  State<YearMonthPickerPage> createState() => _YearMonthPickerPageState();
}

class _YearMonthPickerPageState extends State<YearMonthPickerPage> {
  DateTime? yearMonthSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Year Month Picker Demo')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            yearMonthSelected != null
                ? Text(DateFormat.yMMMM().format(yearMonthSelected!))
                : const Text('No data'),
            BottomSheetPreview(
              initYearMonth: yearMonthSelected,
              onYearMonthSelected: (dateTime) {
                setState(() {
                  yearMonthSelected = dateTime;
                });
              },
            ),
            DialogPreview(
              initYearMonth: yearMonthSelected,
              onYearMonthSelected: (dateTime) {
                setState(() {
                  yearMonthSelected = dateTime;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
