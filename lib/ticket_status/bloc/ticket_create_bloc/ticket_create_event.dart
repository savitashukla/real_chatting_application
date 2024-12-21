part of 'ticket_create_bloc.dart';

abstract class TicketCreateBlocEvent {}

class GetOESCategoriesEvent extends TicketCreateBlocEvent {
  final String id;

  GetOESCategoriesEvent({required this.id});
}

class OnChangeOESCategoryDropDownEvent extends TicketCreateBlocEvent {
  String newItem;
  OnChangeOESCategoryDropDownEvent(this.newItem);
}

class ClearDataEvent extends TicketCreateBlocEvent {}

class CreateTicketAPIEvent extends TicketCreateBlocEvent {
  String? mobileNumber;
  String subject;
  String message;
  String selectedCategory;
  String selectedCategoryName;
  List<File?>? imgFiles;
  String? productId;

  CreateTicketAPIEvent(
      {required this.subject,
      required this.selectedCategory,
      required this.selectedCategoryName,
      this.mobileNumber,
      this.imgFiles,
      this.productId,
      required this.message});
}
