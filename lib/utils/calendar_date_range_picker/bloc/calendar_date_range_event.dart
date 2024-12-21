part of 'calendar_date_range_bloc.dart';

abstract class CalendarDateRangeEvent {}

class OnCalendarDateChangeEvent extends CalendarDateRangeEvent {
  PickerDateRange calendarDateRange;
  OnCalendarDateChangeEvent({required this.calendarDateRange});
}
