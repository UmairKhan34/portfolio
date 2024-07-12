// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:myportfolio/resources/resources.dart';

class HoverButton extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final TextStyle style;

  const HoverButton({
    required this.onTap,
    required this.title,
    required this.style,
    super.key,
  });

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: InkWell(
        onTap: widget.onTap,
        child: Text(
          widget.title,
          style: widget.style.copyWith(
            color: _isHovered ? R.colors.textColor : widget.style.color,
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
