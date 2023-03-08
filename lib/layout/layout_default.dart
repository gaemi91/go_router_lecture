import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutDefault extends StatelessWidget {
  final Widget body;

  const LayoutDefault({required this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(router.location),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: body,
      ),
    );
  }
}
