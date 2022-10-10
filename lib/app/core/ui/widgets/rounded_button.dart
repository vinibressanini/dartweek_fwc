import 'package:dartweek_fwc/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundedButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shape: const CircleBorder(),
      shadowColor: Colors.grey.withOpacity(0.2),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: context.colors.darkGrey,
        ),
      ),
    );
  }
}
