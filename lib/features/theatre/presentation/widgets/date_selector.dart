import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  final List<DateTime> dates;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const DateSelector({
    super.key,
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    String _monthName(int month) {
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return months[month - 1];
    }

    return SizedBox(
      height: 80,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,

        itemBuilder: (context, index) {
          final date = dates[index];

          final selected =
              date.day == selectedDate.day &&
              date.month == selectedDate.month &&
              date.year == selectedDate.year;

          return GestureDetector(
            onTap: () => onDateSelected(date),

            child: Container(
              width: 90,
              margin: const EdgeInsets.symmetric(horizontal: 4),

              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: selected ? Colors.black : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      index == 0
                          ? 'Today'
                          : index == 1
                          ? 'Tomorrow'
                          : '${date.day} ${_monthName(date.month)}',

                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      index == 0 || index == 1
                          ? '${_weekday(date)}, ${date.day} ${_monthName(date.month)}'
                          : _weekday(date),
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _weekday(DateTime date) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return days[date.weekday - 1];
  }
}
