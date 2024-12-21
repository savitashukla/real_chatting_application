part of 'ticket_details_by_id_bloc.dart';

abstract class TicketDetailsByIdState {}

class TicketDetailsByIdInitial extends TicketDetailsByIdState {}

class TicketDetailsByIdLoadingState extends TicketDetailsByIdState {}

class TicketDetailsByIdErrorState extends TicketDetailsByIdState {
  String errorMessage;
  TicketDetailsByIdErrorState({required this.errorMessage});
}

class TicketDetailsByIdLoadedState extends TicketDetailsByIdState {
  TicketDetailsByIdModel ticketDetailsByIdModel;
  TicketDetailsByIdLoadedState({required this.ticketDetailsByIdModel});
}
