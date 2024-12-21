part of 'ticket_count_bloc.dart';

abstract class TicketCountState {
  const TicketCountState();
}

class TicketCountInitial extends TicketCountState {}

class TicketCountLoadingState extends TicketCountState {}

class TicketCountErrorState extends TicketCountState {
  String errorMessage;
  TicketCountErrorState({required this.errorMessage});
}

class TicketCountLoadedState extends TicketCountState {
  TicketCountModel ticketCountModel;
  TicketCountLoadedState({required this.ticketCountModel});
}
