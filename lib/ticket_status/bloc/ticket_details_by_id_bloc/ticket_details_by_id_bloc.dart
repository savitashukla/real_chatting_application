import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:oes_chatbot/core/failure.dart';
import 'package:oes_chatbot/ticket_status/api/ticket_status_api_respository.dart';
import 'package:oes_chatbot/ticket_status/model/ticket_details_by_id_model.dart';

part 'ticket_details_by_id_event.dart';
part 'ticket_details_by_id_state.dart';

class TicketDetailsByIdBloc
    extends Bloc<TicketDetailsByIdBlocEvent, TicketDetailsByIdState> {
  TicketDetailsByIdModel? ticketDetailsByIdModelData;
  TicketDetailsByIdBloc() : super(TicketDetailsByIdInitial()) {
    TicketStatusApiRepository ticketStatusApiRepository =
        TicketStatusApiRepository();
    on<GetTicketDetailsByIdEvent>((event, emit) async {
      emit(TicketDetailsByIdLoadingState());
      Either<Failure, TicketDetailsByIdModel> ticketDetailsByIdResponse =
          await ticketStatusApiRepository.getTicketDetailsByIdData(
              ticketId: event.ticketId ?? '');
      ticketDetailsByIdResponse.fold((Failure error) {
        emit(TicketDetailsByIdErrorState(errorMessage: error.message));
      }, (TicketDetailsByIdModel ticketDetailsByIdModel) {
        ticketDetailsByIdModelData = ticketDetailsByIdModel;
        emit(TicketDetailsByIdLoadedState(
            ticketDetailsByIdModel: ticketDetailsByIdModel));
      });
    });
  }
}
