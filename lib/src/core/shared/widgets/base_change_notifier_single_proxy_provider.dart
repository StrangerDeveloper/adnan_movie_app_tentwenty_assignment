import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Base widget for ChangeNotifierProxyProvider with Consumer
/// Used when a child ChangeNotifier depends on a parent ChangeNotifier
class BaseChangeNotifierSingleProxyProvider<
  T extends ChangeNotifier,
  S extends ChangeNotifier
>
    extends StatelessWidget {
  const BaseChangeNotifierSingleProxyProvider({
    super.key,
    required this.create,
    required this.update,
    required this.builder,
  });

  final S Function(BuildContext context, T parent) create;
  final S Function(BuildContext context, T parent, S? previous) update;
  final Widget Function(BuildContext context, S childModel) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<T, S>(
      create: (context) {
        final parentModel = Provider.of<T>(context, listen: false);
        return create(context, parentModel);
      },
      update: (context, parentModel, previous) {
        return update(context, parentModel, previous);
      },
      child: Consumer<S>(
        builder: (context, childModel, _) {
          return builder(context, childModel);
        },
      ),
    );
  }
}
