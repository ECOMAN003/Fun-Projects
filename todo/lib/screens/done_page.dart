import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

class DonePage extends StatefulWidget {
  const DonePage({Key? key}) : super(key: key);

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lastColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'Completed',
          style: TextStyle(color: lastColor),
        ),
        elevation: 0,
      ),
     
    );
  }
}
