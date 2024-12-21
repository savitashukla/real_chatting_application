import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oes_chatbot/chat_bot/bloc/chatbot_products.dart';
import 'package:oes_chatbot/chat_bot/presentation/components/chat_message_left_tile_widget.dart';
import 'package:oes_chatbot/chat_bot/presentation/components/chatbot_filter_chip.dart';
import 'package:oes_chatbot/core/theme.dart';

class ChatBotSelectProductWidget extends StatelessWidget {
  final Function(Tuple3<String, String, String>) selectedProduct;
  const ChatBotSelectProductWidget({
    Key? key,
    required this.selectedProduct,
  }) : super(key: key);

  // final List<Tuple3<String, String, String>> products = [
  //   const Tuple3('OES', 'productinfo;oes', 'P112P000001'),
  //   const Tuple3('O-Mail', 'productinfo;o-mail', 'P1121000002'),
  //   const Tuple3('O-Net', 'productinfo;o-net', 'P1121000004'),
  //   const Tuple3('O-Trim', 'productinfo;o-trim', 'P1121000006'),
  //   const Tuple3('O-Tracker', 'productinfo;o-tracker', 'P1123000008'),
  //   const Tuple3('O-Connect', 'productinfo;o-connect', 'P1123000005'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChatMessageLeftTileWidget(
          message: 'Please select the product you want to explore.',
        ),
        BlocBuilder<ChatbotProdocutsCubit, ChatbotProdocutsCubitState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            }

            if (!state.isSuccess) return const SizedBox();

            final products = state.data!
                .map((e) => Tuple3(
                    e.productName,
                    'productinfo;${e.productName.toLowerCase()}',
                    e.productDisplayId))
                .toList();

            return Wrap(
                spacing: 10,
                children: List.generate(
                  products.length,
                  (index) => ChatBotFilterWidget(
                    label: products[index].value1,
                    color: context.colors.background,
                    onTap: () {
                      selectedProduct(products[index]);
                    },
                  ),
                ));
          },
        ),
      ],
    );
  }
}
