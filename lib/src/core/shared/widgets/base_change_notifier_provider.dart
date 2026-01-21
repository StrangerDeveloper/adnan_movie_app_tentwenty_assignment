import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Base widget for ChangeNotifierProvider with Consumer
/// Simplifies the pattern of providing and consuming a ChangeNotifier
class BaseChangeNotifierProvider<T extends ChangeNotifier>
    extends StatelessWidget {
  const BaseChangeNotifierProvider({
    super.key,
    required this.create,
    required this.builder,
  });

  final T Function(BuildContext context) create;
  final Widget Function(BuildContext context, T model) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: create,
      child: Consumer<T>(
        builder: (context, model, _) {
          return builder(context, model);
        },
      ),
    );
  }
}
