import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oes_chatbot/utils/assets.dart';
import 'package:oes_chatbot/core/size_config.dart';
import 'package:oes_chatbot/utils/extensions/sizedbox_extension.dart';
import 'package:oes_chatbot/core/theme.dart';

class ChatBotAppBar extends StatelessWidget {
  const ChatBotAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(Assets.chatbot),
        getProportionateScreenWidth(10).width,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OChatBot',
              style: TextStyle(
                  color: context.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: getFontSize(20)),
            ),
            Row(
              children: [
                const Icon(
                  Icons.circle,
                  color: Color(0xff28D15B),
                  size: 8,
                ),
                getProportionateScreenWidth(5).width,
                Text(
                  'online',
                  style:
                      TextStyle(fontSize: getFontSize(12), color: Colors.white),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
