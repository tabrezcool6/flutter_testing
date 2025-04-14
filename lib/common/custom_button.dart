import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    required this.onTap,
    this.isFullWidth = true,
    super.key,
  });
  final String title;
  final VoidCallback onTap;
  bool isFullWidth = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: isFullWidth ? MediaQuery.of(context).size.width * 0.6 : null,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}

/// Divider Widget
class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.symmetric(vertical: 14.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
    );
  }
}
