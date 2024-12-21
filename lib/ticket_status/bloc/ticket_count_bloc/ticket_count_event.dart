part of 'ticket_count_bloc.dart';

abstract class TicketCountBlocEvent {
  const TicketCountBlocEvent();
}

class GetTicketCountEvent extends TicketCountBlocEvent {}
