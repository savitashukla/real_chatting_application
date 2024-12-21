import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:oes_chatbot/core/failure.dart';
import 'package:oes_chatbot/ticket_status/api/ticket_status_api_respository.dart';
import 'package:oes_chatbot/ticket_status/model/ticket_status_response_model.dart';
part 'ticket_count_event.dart';
part 'ticket_count_state.dart';

class TicketCountBloc extends Bloc<TicketCountBlocEvent, TicketCountState> {
  TicketCountBloc() : super(TicketCountInitial()) {
    TicketStatusApiRepository ticketStatusApiRepository =
        TicketStatusApiRepository();
    on<GetTicketCountEvent>((event, emit) async {
      emit(TicketCountLoadingState());
      Either<Failure, TicketCountModel> ticketCountResponse =
          await ticketStatusApiRepository.getTicketCountData();
      ticketCountResponse.fold((Failure error) {
        emit(TicketCountErrorState(errorMessage: error.message));
      }, (TicketCountModel ticketCountModel) {
        emit(TicketCountLoadedState(ticketCountModel: ticketCountModel));
      });
    });
  }
}
