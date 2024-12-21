import 'package:flutter/material.dart';
import 'package:oes_chatbot/core/theme.dart';
import 'package:oes_chatbot/ticket_status/presentation/components/ticket_info_tile.dart';
import 'package:oes_chatbot/utils/assets.dart';

class TicketInfoWidget extends StatelessWidget {
  final String? emailId;
  final String? location;
  final String? region;
  final String? product;
  final String? categoryType;
  final String? assignedTo;
  final String? phoneNumber;
  final String? timeOfTicket;
  const TicketInfoWidget(
      {Key? key,
      this.assignedTo,
      this.categoryType,
      this.emailId,
      this.location,
      this.phoneNumber,
      this.product,
      this.region,
      this.timeOfTicket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.background1,
          border: Border.all(color: Colors.transparent),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TicketInfoTile(
            asset: Assets.mailTs,
            tileName: "Email Id",
            tileData: emailId ?? "abc@onpassive.mail",
          ),
          TicketInfoTile(
            asset: Assets.locationTs,
            tileName: "Location",
            tileData: location ?? "India",
          ),
          TicketInfoTile(
            asset: Assets.regionTs,
            tileName: "Region",
            tileData: region ?? "",
          ),
          TicketInfoTile(
            asset: Assets.productTs,
            tileName: "Product",
            tileData: product ?? "",
          ),
          TicketInfoTile(
            asset: Assets.categoryTs,
            tileName: "Category Type",
            tileData: categoryType ?? "",
          ),
          TicketInfoTile(
            asset: Assets.assignTs,
            tileName: "Assigned To",
            tileData: assignedTo ?? "",
          ),
          TicketInfoTile(
            asset: Assets.phoneTs,
            tileName: "Phone Number",
            tileData: phoneNumber ?? "",
          ),
          TicketInfoTile(
            asset: Assets.timeTs,
            tileName: "Time of Ticket",
            tileData: timeOfTicket ?? "",
          ),
        ],
      ),
    );
  }
}
