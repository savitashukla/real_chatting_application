import 'package:flutter/material.dart';
import 'package:oes_chatbot/core/app_theme.dart';
import 'package:oes_chatbot/core/size_config.dart';
import 'package:oes_chatbot/utils/extensions/sizedbox_extension.dart';

class IssueResolvedYesNoWidget extends StatelessWidget {
  final Function thumbsUpPressed;
  final Function thumbsDownPressed;
  const IssueResolvedYesNoWidget(
      {Key? key,
      required this.thumbsUpPressed,
      required this.thumbsDownPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(100),
      width: getSize(100),
      child: Container(
        decoration: BoxDecoration(
            color: ChatBotAppTheme.blueColor.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Was your issue resolved"),
            getProportionateScreenHeight(10).height,
            SizedBox(
              width: getSize(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: () {
                        thumbsUpPressed();
                      },
                      icon: const Icon(
                        Icons.thumb_up,
                        color: ChatBotAppTheme.whiteColor,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      onPressed: () {
                        thumbsDownPressed();
                      },
                      icon: const Icon(
                        Icons.thumb_down,
                        color: ChatBotAppTheme.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
