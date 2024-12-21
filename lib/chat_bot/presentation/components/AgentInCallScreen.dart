import 'package:flutter/material.dart';
import 'package:oes_chatbot/core/size_config.dart';
import 'package:oes_chatbot/utils/extensions/sizedbox_extension.dart';

class AgentInCallWidget extends StatelessWidget {
  final Function micTapped;
  final Function endCallTapped;
  final Function chatTapped;
  const AgentInCallWidget(
      {super.key,
      required this.micTapped,
      required this.endCallTapped,
      required this.chatTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/chatbot/agent-in-call.png',
                scale: 1,
              ),
              getProportionateScreenHeight(20).height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: IconButton(
                      onPressed: () {
                        micTapped();
                      },
                      icon: const Icon(Icons.mic),
                    ),
                  ),
                  getProportionateScreenWidth(40).width,
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.red,
                    child: IconButton(
                      onPressed: () {
                        endCallTapped();
                      },
                      icon: const Icon(Icons.call_end_sharp),
                    ),
                  )
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                chatTapped();
              },
              child: Icon(
                Icons.chat,
                size: getSize(35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
