part of 'ticket_chat_bloc.dart';

abstract class TicketChatState extends Equatable {}

class TicketChatInitial extends TicketChatState {
  @override
  List get props => [];
}

class TicketChatLoadingState extends TicketChatState {
  @override
  List get props => [];
}

class TicketChatErrorState extends TicketChatState {
  final String errorMessage;
  TicketChatErrorState({required this.errorMessage});

  @override
  List get props => [errorMessage];
}

class TicketChatLoadedState extends TicketChatState {
  TicketChatModel ticketChatModel;
  TicketChatLoadedState({required this.ticketChatModel});

  @override
  List get props => [ticketChatModel];
}
