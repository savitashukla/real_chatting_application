import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:oes_chatbot/core/app_theme.dart';
import 'package:oes_chatbot/core/size_config.dart';

class LiveAgentRatingWidget extends StatelessWidget {
  final Function(double) ratingPressed;
  final String? ratingSaved;

  const LiveAgentRatingWidget({
    Key? key,
    required this.ratingPressed,
    this.ratingSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ratingSaved != null
              ? const SizedBox.shrink()
              : const Text(
                  'How would you rate your overall chat experience',
                  style: TextStyle(color: ChatBotAppTheme.blueColor),
                ),
          ratingSaved != null
              ? Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: ChatBotAppTheme.greenColor,
                      size: getSize(100),
                    ),
                    Text(
                      'Thank You for Rating',
                      style: TextStyle(
                          color: ChatBotAppTheme.blueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: getFontSize(30)),
                    ),
                  ],
                )
              : RatingBar.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    ratingPressed(rating);
                  },
                  tapOnlyMode: true,
                )
        ],
      ),
    );
  }
}
