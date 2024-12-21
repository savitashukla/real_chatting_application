import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:oes_chatbot/chat_bot/presentation/components/chatbot_filter_chip.dart';
import 'package:oes_chatbot/core/theme.dart';

class ChooseBotCommunicationType extends StatelessWidget {
  final Function(int) selectedType;
  ChooseBotCommunicationType({Key? key, required this.selectedType})
      : super(key: key);

  final List<Tuple2<int, String>> products = [
    const Tuple2(0, 'Continue with Bot'),
    const Tuple2(1, 'Connect to live Agent'),
    const Tuple2(2, 'Raise a Ticket'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        children: List.generate(
          products.length,
          (index) => ChatBotFilterWidget(
            label: products[index].value2,
            color: context.background2,
            onTap: () {
              selectedType(products[index].value1);
            },
          ),
        ));
  }
}
