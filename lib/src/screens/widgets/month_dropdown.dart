import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonthDropdown extends StatefulWidget {
  const MonthDropdown({super.key, required this.onSelected});
final Function(int) onSelected;
  @override
  State<MonthDropdown> createState() => _MonthDropdownState();
}

class _MonthDropdownState extends State<MonthDropdown> {
  final List<String> months = [
    'All',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String selectedMonth = 'All';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        setState(() {
          selectedMonth = value;
        });
        widget.onSelected(months.indexOf(selectedMonth));
      },
      itemBuilder: (BuildContext context) {
        return months.map((String month) {
          return PopupMenuItem<String>(
            value: month,
            child: Text(month),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedMonth,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 4),
            const Icon(CupertinoIcons.chevron_down, size: 12),
          ],
        ),
      ),
    );
  }
}
