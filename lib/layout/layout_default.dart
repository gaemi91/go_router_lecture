import 'package:flutter/material.dart';

class LayoutDefault extends StatelessWidget {
  final Widget body;

  const LayoutDefault({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('test'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: body,
      ),
    );
  }
}
