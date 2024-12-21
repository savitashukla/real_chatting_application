import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:oes_chatbot/chat_bot/model/ticket_chat_model.dart';
import 'package:oes_chatbot/core/failure.dart';
import 'package:oes_chatbot/ticket_status/api/ticket_status_api_respository.dart';
import 'package:oes_chatbot/ticket_status/model/send_message_to_ticket_agent_model.dart';

part 'ticket_chat_event.dart';
part 'ticket_chat_state.dart';

class TicketChatBloc extends Bloc<TicketChatBlocEvent, TicketChatState> {
  TicketChatModel? ticketChatModelData;
  String? fetchChatTicketIt;
  TicketChatBloc() : super(TicketChatInitial()) {
    TicketStatusApiRepository ticketStatusApiRepository =
        TicketStatusApiRepository();
    on<GetTicketChatEvent>((event, emit) async {
      emit(TicketChatLoadingState());
      Either<Failure, TicketChatModel> ticketChatResponse =
          await ticketStatusApiRepository.getTicketChatData(
              ticketMongoId: event.ticketId ?? '');
      ticketChatResponse.fold((Failure error) {
        emit(TicketChatErrorState(errorMessage: error.message));
      }, (TicketChatModel ticketChatModel) {
        ticketChatModelData = ticketChatModel;
        fetchChatTicketIt = event.ticketId;
        debugPrint('emitting TicketChatLoadedState');
        emit(TicketChatLoadedState(ticketChatModel: ticketChatModelData!));
      });
    });

    on<SendMessageToAgentEvent>((event, emit) async {
      emit(TicketChatLoadingState());
      Either<Failure, SendMessageToAgentResponseModel> ticketChatResponse =
          await ticketStatusApiRepository.sendMessageToAgent(
              message: event.message,
              ticketId: event.ticketId,
              files: event.files,
              userName: event.userName);
      ticketChatResponse.fold((Failure error) {
        emit(TicketChatErrorState(errorMessage: error.message));
      }, (SendMessageToAgentResponseModel sendMessageToAgentResponseModel) {
        ticketChatModelData?.object?.ceoMailDto
            ?.add(CeoMailDto(name: event.userName, mailBody: event.message));
        emit(TicketChatLoadedState(ticketChatModel: ticketChatModelData!));
      });
    });
  }
}
