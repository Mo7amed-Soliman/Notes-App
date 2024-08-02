import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/views/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //? title
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),

        //? icon
        CustomIcon(onTap: onTap, icon: icon),
      ],
    );
  }
}
