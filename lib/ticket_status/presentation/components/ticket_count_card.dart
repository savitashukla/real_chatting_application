import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oes_chatbot/core/screen_config.dart';
import 'package:oes_chatbot/core/size_config.dart';
import 'package:oes_chatbot/utils/extensions/sizedbox_extension.dart';
import 'package:oes_chatbot/utils/text_styles.dart';

class TicketCountCard extends StatelessWidget {
  final int cardColor;
  final String cardType;
  final int noOfTickets;
  final SvgPicture ticketType;
  final int borderColor;

  const TicketCountCard(
      {super.key,
      required this.cardColor,
      required this.cardType,
      required this.noOfTickets,
      required this.ticketType,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenConfig.width * 0.27,
      decoration: BoxDecoration(
          color: Color(cardColor),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(borderColor))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            getProportionateScreenHeight(5).height,
            CircleAvatar(
                backgroundColor: Color(cardColor),
                radius: 15,
                child: ticketType),
            Text(
              noOfTickets.toString(),
              style: TextStyles.semiBold(size: 18),
            ),
            Text(
              "$cardType Tickets",
              style: TextStyles.regular(size: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
