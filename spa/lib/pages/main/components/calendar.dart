import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:spa/constants/const_style.dart';
import 'package:spa/helpers/date_util.dart';
import 'package:spa/stores/util_store.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime fDay;
  late ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    UtilStore _utilStore = GetIt.I<UtilStore>();
    themeData = Theme.of(context);
    fDay = DateTime.now();
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: themeData.colorScheme.onBackground,
        ),
        height: 400,
        child: Observer(builder: (_) {
          return TableCalendar(
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: themeData.colorScheme.primary,
              ),
              rightChevronIcon: Icon(Icons.chevron_right,
                  color: themeData.colorScheme.primary),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle:
                  TextStyle(color: themeData.primaryColor.withOpacity(0.25)),
              weekdayStyle: TextStyle(color: themeData.primaryColor),
            ),
            availableGestures: AvailableGestures.horizontalSwipe,
            //enabledDayPredicate: (DateTime val) => val.isBefore(DateUtil.getOneDayAgo()) ? false : true,
            calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                    color: themeData.colorScheme.primary,
                    shape: BoxShape.circle),
                weekendTextStyle: TextStyle(
                    color: themeData.colorScheme.primary.withOpacity(0.25)),
                todayTextStyle: TextStyle(
                  color: themeData.colorScheme.onBackground,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                )),
            lastDay: DateTime.utc(2022, 10, 16),
            locale: 'pt-br',
            firstDay: DateTime.utc(2010, 10, 16),
            focusedDay: _utilStore.focusedDay,

            onDaySelected: (selectedDay, focusedDay) {
              _utilStore.setSelectedDay(selectedDay);
              _utilStore.setFocusedDay(focusedDay);
            },
          );
        }),
      ),
    );
  }
}
