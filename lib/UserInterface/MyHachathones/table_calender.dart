import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarAgenda extends StatefulWidget {
  @override
  _CalendarAgendaState createState() => _CalendarAgendaState();
}

class _CalendarAgendaState extends State<CalendarAgenda> {
  DateTime _selectedDate = DateTime.now();
  DateTime? _selectedDay; 
  late List<DateTime> _daysInMonth;

  @override
  void initState() {
    super.initState();
    _daysInMonth = _generateDaysInMonth(_selectedDate.year, _selectedDate.month);
  }

  List<DateTime> _generateDaysInMonth(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);
    return List<DateTime>.generate(
      lastDay.day,
      (index) => DateTime(year, month, index + 1),
    );
  }

  void _onMonthYearChanged(int year, int month) {
    setState(() {
      _selectedDate = DateTime(year, month, 1);
      _daysInMonth = _generateDaysInMonth(year, month);
      _selectedDay = null; 
    });
  }

  void _onDaySelected(DateTime day) {
    setState(() {
      _selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        // Month and Year Dropdowns
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMMM yyyy').format(_selectedDate),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.yellow),
              ),
              Row(
                children: [
                  // Month Dropdown
                  DropdownButton<int>(
                    value: _selectedDate.month,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.yellow),
                    items: List.generate(12, (index) {
                      return DropdownMenuItem(
                        value: index + 1,
                        child: Text(
                          DateFormat('MMMM').format(DateTime(0, index + 1)),
                          style: const TextStyle(fontSize: 12 , color: Colors.yellow),
                        ),
                      );
                    }),
                    onChanged: (month) {
                      if (month != null) {
                        _onMonthYearChanged(_selectedDate.year, month);
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  // Year Dropdown
                  DropdownButton<int>(
                    value: _selectedDate.year,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.yellow),
                    items: List.generate(50, (index) {
                      int year = DateTime.now().year - 25 + index;
                      return DropdownMenuItem(
                        value: year,
                        child: Text(
                          year.toString(),
                          style: const TextStyle(fontSize: 12, color: Colors.yellow), 
                        ),
                      );
                    }),
                    onChanged: (year) {
                      if (year != null) {
                        _onMonthYearChanged(year, _selectedDate.month);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        // Agenda Scrollable Days
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _daysInMonth.length,
            itemBuilder: (context, index) {
              final day = _daysInMonth[index];
              final isSelected = _selectedDay == day;

              return GestureDetector(
                onTap: () => _onDaySelected(day),
                child: Container(
                  width: MediaQuery.of(context).size.width / 7,
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color.fromARGB(255, 237, 234, 207) : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: isSelected ? Colors.black : Colors.transparent, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('EEE').format(day),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.black : Colors.yellow,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('d').format(day),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.black : Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
