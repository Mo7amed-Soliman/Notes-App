import 'package:flutter/material.dart';

class CustomNoNotes extends StatelessWidget {
  const CustomNoNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
        const Image(image: AssetImage('assets/images/no_notes.png')),
        const SizedBox(height: 16),
        const Text(
          'Create your first note !',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
