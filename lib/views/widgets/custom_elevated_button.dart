import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Ok', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
