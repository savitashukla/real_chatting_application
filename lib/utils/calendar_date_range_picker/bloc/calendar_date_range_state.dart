part of 'calendar_date_range_bloc.dart';

abstract class CalendarDateRangeState {}

class CalendarDateRangeUpdated extends CalendarDateRangeState {
  PickerDateRange calendarDateRange;
  CalendarDateRangeUpdated({required this.calendarDateRange});
}
