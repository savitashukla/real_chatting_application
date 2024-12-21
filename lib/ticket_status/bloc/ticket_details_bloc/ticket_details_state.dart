
part of 'ticket_details_bloc.dart';

abstract class TicketDetailsState {}

class TicketDetailsInitial extends TicketDetailsState {}

class TicketDetailsLoadingState extends TicketDetailsState {}

class TicketDetailsErrorState extends TicketDetailsState {
  String errorMessage;
  TicketDetailsErrorState({required this.errorMessage});
}

class TicketDetailsLoadedState extends TicketDetailsState {
  TicketDetailsModel ticketDetailsModel;
  List<TicketData> ticketsList;
  bool isApplied;
  bool isLoadingMore;
  bool reachedMax;
  PickerDateRange? dateFilterRange;
    TicketDetailsLoadedState({
    required this.ticketDetailsModel,
    required this.ticketsList,
     this.isApplied = false,
     this.isLoadingMore =false,
     this.reachedMax =false,
    this.dateFilterRange
  });

  TicketDetailsLoadedState copyWith({
    TicketDetailsModel? ticketDetailsModel,
    List<TicketData>? ticketsList,
    bool? isApplied,
    bool? isLoadingMore,
    bool? reachedMax,
    PickerDateRange? dateFilterRange    
  }) {
    return TicketDetailsLoadedState(
          ticketDetailsModel: ticketDetailsModel ?? this.ticketDetailsModel,
      ticketsList: ticketsList ?? this.ticketsList,
      isApplied: isApplied ?? this.isApplied,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      reachedMax: reachedMax ?? this.reachedMax,
      dateFilterRange: dateFilterRange ?? this.dateFilterRange
    );
  }
}
