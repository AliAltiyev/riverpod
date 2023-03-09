import 'package:flutter/material.dart';

class CustomTooltip extends StatefulWidget {
  const CustomTooltip(
      {Key? key, required this.message, required this.buttonText})
      : super(key: key);
  final String message;
  final String buttonText;

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.message,
      child: TextButton(onPressed: () {}, child: Text(widget.buttonText)),
    );
  }
}
