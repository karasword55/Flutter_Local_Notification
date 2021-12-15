import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String? payload;
  const SecondPage({Key? key, this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            payload ?? '',
          ),
          SizedBox(height: 10,),
          Text(
            'PAYLOAD'
          ),
        ],
      ),
    );
  }
}