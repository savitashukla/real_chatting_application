part of 'ticket_details_bloc.dart';

abstract class TicketDetailsBlocEvent {
  const TicketDetailsBlocEvent();
}

class GetTicketDetailsEvent extends TicketDetailsBlocEvent {
  bool loadMore;
  bool isRestart;
  GetTicketDetailsEvent({this.loadMore = false, this.isRestart = false});
}

class OnTicketDateFilterChange extends TicketDetailsBlocEvent {
  PickerDateRange? pickerDateRange;
  OnTicketDateFilterChange({this.pickerDateRange});
}

class OnTicketFilterApply extends TicketDetailsBlocEvent {}
