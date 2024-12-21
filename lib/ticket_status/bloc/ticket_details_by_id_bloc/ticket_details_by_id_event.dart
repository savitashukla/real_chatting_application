part of 'ticket_details_by_id_bloc.dart';

abstract class TicketDetailsByIdBlocEvent {
  const TicketDetailsByIdBlocEvent();
}

class GetTicketDetailsByIdEvent extends TicketDetailsByIdBlocEvent {
  String? ticketId;
  GetTicketDetailsByIdEvent({required this.ticketId});
}
