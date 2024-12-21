part of 'ticket_chat_bloc.dart';

abstract class TicketChatBlocEvent {
  const TicketChatBlocEvent();
}

class GetTicketChatEvent extends TicketChatBlocEvent {
  String? ticketId;
  GetTicketChatEvent({required this.ticketId});
}

class SendMessageToAgentEvent extends TicketChatBlocEvent {
  String message;
  String ticketId;
  String userName;
  List<File>? files;
  SendMessageToAgentEvent(
      {required this.message,
      required this.ticketId,
      required this.userName,
      this.files});
}
