import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oes_chatbot/utils/date_picker/date_picker_manager.dart';

part 'calendar_date_range_event.dart';
part 'calendar_date_range_state.dart';

class CalendarDateRangeBloc
    extends Bloc<CalendarDateRangeEvent, CalendarDateRangeState> {
  CalendarDateRangeBloc()
      : super(CalendarDateRangeUpdated(
          calendarDateRange: PickerDateRange(
            DateTime.now(),
            DateTime.now(),
          ),
        )) {
    on<OnCalendarDateChangeEvent>((event, emit) {
      DateTime startDate = event.calendarDateRange.startDate ?? DateTime.now();
      DateTime endDate = event.calendarDateRange.endDate ?? DateTime.now();
      emit(CalendarDateRangeUpdated(
        calendarDateRange: PickerDateRange(
          startDate,
          endDate,
        ),
      ));
    });
  }
}
