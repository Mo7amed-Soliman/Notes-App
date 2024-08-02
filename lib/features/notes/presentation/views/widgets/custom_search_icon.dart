import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onTap});
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 47,
        width: 47,
        decoration: BoxDecoration(
          color: const Color(0xff3B3B3B),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 24,
          ),
        ),
      ),
    );
  }
}
