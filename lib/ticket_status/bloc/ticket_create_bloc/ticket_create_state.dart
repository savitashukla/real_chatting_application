part of 'ticket_create_bloc.dart';

abstract class TicketCreateState {}

class TicketCreateInitial extends TicketCreateState {}

class TicketCreateLoadingState extends TicketCreateState {}

class TicketCreateErrorState extends TicketCreateState {
  String errorMessage;
  TicketCreateErrorState({required this.errorMessage});
}

class TicketCreateLoadedState extends TicketCreateState {
  ProductCategoriesModel? ticketCreateModel;
  String? selectedCategory;
  TicketCreateSuccessModel? ticketCreateSuccessModel;
  TicketCreateLoadedState(
      {this.ticketCreateModel,
      this.selectedCategory,
      this.ticketCreateSuccessModel});
}

class TicketCreateSuccessState extends TicketCreateState {}
