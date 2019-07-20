//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0

part of table_calendar;

class _CellWidget extends StatelessWidget {
  final String text;
  final bool isUnavailable;
  final bool isSelected;
  final bool isToday;
  final bool isWeekend;
  final bool isOutsideMonth;
  final bool isHoliday;
  final CalendarStyle calendarStyle;

  const _CellWidget({
    Key key,
    @required this.text,
    this.isUnavailable = false,
    this.isSelected = false,
    this.isToday = false,
    this.isWeekend = false,
    this.isOutsideMonth = false,
    this.isHoliday = false,
    @required this.calendarStyle,
  })  : assert(text != null),
        assert(calendarStyle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // return AnimatedContainer(
    //   duration: const Duration(milliseconds: 250),
    return Container(
      decoration: _buildCellDecoration(),
      // margin: const EdgeInsets.all(6.0),
      alignment: Alignment.center,
      child: Text(
        text,
        style: _buildCellTextStyle(),
      ),
    );
  }

  Decoration _buildCellDecoration() {
    if (isWeekend) {
      return BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      );
    }
    return BoxDecoration(
      border: Border(
        left: BorderSide(width: 1.0, color: Colors.grey),
        bottom: BorderSide(width: 1.0, color: Colors.grey),
      )
    );
    /*
    if (isSelected && calendarStyle.renderSelectedFirst) {
      return BoxDecoration(shape: BoxShape.circle, color: calendarStyle.selectedColor);
    } else if (isToday) {
      return BoxDecoration(shape: BoxShape.circle, color: calendarStyle.todayColor);
    } else if (isSelected) {
      return BoxDecoration(shape: BoxShape.circle, color: calendarStyle.selectedColor);
    } else {
      return BoxDecoration(shape: BoxShape.circle);
    }
    */
  }

  TextStyle _buildCellTextStyle() {
    if (isHoliday) {
      return calendarStyle.holidayStyle;
    } else if (isWeekend) {
      return calendarStyle.weekendStyle;
    }
    return calendarStyle.weekdayStyle;
    /*
    if (isUnavailable) {
      return calendarStyle.unavailableStyle;
    } else if (isSelected && calendarStyle.renderSelectedFirst) {
      return calendarStyle.selectedStyle;
    } else if (isToday) {
      return calendarStyle.todayStyle;
    } else if (isSelected) {
      return calendarStyle.selectedStyle;
    } else if (isOutsideMonth && isHoliday) {
      return calendarStyle.outsideHolidayStyle;
    } else if (isHoliday) {
      return calendarStyle.holidayStyle;
    } else if (isOutsideMonth && isWeekend) {
      return calendarStyle.outsideWeekendStyle;
    } else if (isOutsideMonth) {
      return calendarStyle.outsideStyle;
    } else if (isWeekend) {
      return calendarStyle.weekendStyle;
    } else {
      return calendarStyle.weekdayStyle;
    }
    */
  }
}
