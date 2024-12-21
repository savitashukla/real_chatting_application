part of 'chat_bot_bloc.dart';

abstract class ChatBotBlocEvent {}

class GetChatBotBlocEvent extends ChatBotBlocEvent {
  String apiMessage;
  String? displayMessage;
  String? productCode;
  GetChatBotBlocEvent(
      {required this.apiMessage, this.productCode, this.displayMessage});
}

class SaveChatBotConversationEvent extends ChatBotBlocEvent {
  bool issueResolved;
  bool sendTranscript;
  String customerId;
  SaveChatBotConversationEvent({
    required this.issueResolved,
    required this.sendTranscript,
    required this.customerId,
  });
}

class InitChatBotEvent extends ChatBotBlocEvent {}

class ProvideRatingEvent extends ChatBotBlocEvent {
  int rating;
  String customerId;
  ProvideRatingEvent({
    required this.rating,
    required this.customerId,
  });
}

class InsertCustomerDetails extends ChatBotBlocEvent {}

class WaitingForAgent extends ChatBotBlocEvent {
  String communicationType;
  WaitingForAgent({required this.communicationType});
}

class RefreshAgentChatEvent extends ChatBotBlocEvent {
  ReceiveMessageDataModel receiveMessageDataModel;
  RefreshAgentChatEvent({required this.receiveMessageDataModel});
}

class AgentAssignedEvent extends ChatBotBlocEvent {
  AgentAssignedDataModel agentAssignedDataModel;
  String communicationType;
  AgentAssignedEvent(
      {required this.agentAssignedDataModel, required this.communicationType});
}

class ChatEndedEvent extends ChatBotBlocEvent {
  ChatEndedSocketResponseModel chatEndedSocketResponseModel;
  ChatEndedEvent({required this.chatEndedSocketResponseModel});
}

class RateLiveAgentEvent extends ChatBotBlocEvent {
  int rating;
  RateLiveAgentEvent({required this.rating});
}

class IssueResolvedEvent extends ChatBotBlocEvent {
  bool showRateLiveAgentScreen;
  bool? issueResolved;
  IssueResolvedEvent(
      {required this.showRateLiveAgentScreen, this.issueResolved});
}

class AddChatIdEvent extends ChatBotBlocEvent {
  String chatId;
  AddChatIdEvent({required this.chatId});
}

class AgentInCallEvent extends ChatBotBlocEvent {}

class AgentInCallWithChatEvent extends ChatBotBlocEvent {}

class KeyBoardListenerEvent extends ChatBotBlocEvent {
  bool keyboardEnabled;
  KeyBoardListenerEvent({required this.keyboardEnabled});
}
