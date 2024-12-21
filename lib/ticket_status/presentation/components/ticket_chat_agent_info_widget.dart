import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oes_chatbot/core/key_properties.dart';
import 'package:oes_chatbot/core/size_config.dart';
import 'package:oes_chatbot/utils/extensions/sizedbox_extension.dart';
import 'package:oes_chatbot/utils/text_styles.dart';

class TicketChatAgentInfoWidget extends StatelessWidget {
  final String? imgUrl;
  final String? agentName;
  const TicketChatAgentInfoWidget({Key? key, this.imgUrl, this.agentName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          getProportionateScreenHeight(0).height,
          Row(
            children: [
              SizedBox(
                width: getSize(50),
                height: getSize(50),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SvgPicture.network(
                      KeyProperties.defaultImage,
                      fit: BoxFit.cover,
                    )),
              ),
              getProportionateScreenWidth(10).width,
              Text(
                agentName ?? '',
                style: TextStyles.medium(size: 18, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
