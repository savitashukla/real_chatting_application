import 'package:flutter/material.dart';
import 'package:oes_chatbot/core/size_config.dart';
import 'package:oes_chatbot/core/theme.dart';
import 'package:oes_chatbot/utils/custom_button.dart';
import 'package:oes_chatbot/utils/extensions/sizedbox_extension.dart';

class TicketCreateSuccessWidget extends StatelessWidget {
  final String ticketId;
  final Function viewTicketPressed;
  const TicketCreateSuccessWidget(
      {Key? key, required this.ticketId, required this.viewTicketPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.4,
      width: SizeConfig.screenHeight! * 0.4,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          border: Border.all(color: Colors.blue)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ticket has been submitted successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.textColor,
              ),
            ),
            getProportionateScreenHeight(20).height,
            RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'The TicketID is ',
                      style: TextStyle(
                        color: context.textColor,
                      ),
                    ),
                    TextSpan(
                        text: '$ticketId.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: context.textColor,
                        )),
                  ],
                  style: const TextStyle(
                      // color: AppTheme.backgroundColorDarkTheme,
                      )),
            ),
            Text(
              'Ticket details are sent to your E-mail.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.textColor,
              ),
            ),
            getProportionateScreenHeight(20).height,
            CustomButtonWidget(
              text: 'View Ticket',
              textColor: Theme.of(context).indicatorColor,
              height: getSize(30),
              onTap: () {
                viewTicketPressed();
              },
            )
          ],
        ),
      ),
    );
  }
}
