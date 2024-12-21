import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oes_chatbot/core/size_config.dart';
import 'package:oes_chatbot/core/theme.dart';
import 'package:oes_chatbot/utils/assets.dart';
import 'package:oes_chatbot/utils/colors.dart';
import 'package:oes_chatbot/utils/extensions/sizedbox_extension.dart';
import 'package:oes_chatbot/utils/font_styles_global.dart';

class TicketInfoTile extends StatelessWidget {
  final String? asset;
  final String? tileName;
  final String? tileData;
  const TicketInfoTile({Key? key, this.asset, this.tileData, this.tileName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.isDarkTheme
                    ? context.colors.background2
                    : const Color(0xffDBEEFF)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  asset ?? Assets.FAQs2,
                  color:
                      context.isDarkTheme ? Colors.blue : AppColors.scienceBlue,
                )),
          ),
          getProportionateScreenWidth(16).width,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tileName!,
                style: w400_13Poppins(color: const Color(0xff0367CC)),
              ),
              Text(
                tileData!,
                style: w600_14Poppins(color: context.colors.textColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
