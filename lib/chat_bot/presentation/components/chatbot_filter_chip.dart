import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oes_chatbot/utils/extensions/string_extensions.dart';

class ChatBotFilterWidget extends StatelessWidget {
  final String label;
  final Color color;
  final GestureTapCallback? onTap;
  final bool? enableInteraction;
  final TextStyle? style;
  final double? elevation;
  final EdgeInsets? padding;
  final bool showOriginal = false;
  const ChatBotFilterWidget({
    super.key,
    required this.label,
    required this.color,
    this.onTap,
    this.enableInteraction,
    this.style,
    this.elevation,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        labelPadding: const EdgeInsets.all(2.0),
        label: Text(
          showOriginal ? label : label.toString().productNameUpperCase,
          style: style,
        ),
        backgroundColor: color,
        elevation: elevation ?? 6.0,
        shadowColor: Colors.grey[60],
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
