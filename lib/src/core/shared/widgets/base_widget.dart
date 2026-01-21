import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/app_app_bar.dart';

/// Base widget that provides common scaffold functionality
/// Use this widget as a wrapper for screens to get consistent behavior
class BaseWidget extends StatelessWidget {
  const BaseWidget({
    super.key,
    required this.child,
    this.appBar,
    this.scaffoldBackgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButton,
    this.onPopInvokedWithResult,
    this.canPop,
    this.floatingActionButtonLocation,
    this.appBarTitle,
    this.appBarActions,
    this.appBarLeading,
    this.titleTextStyle,
    this.elevation,
    this.backgroundColor,
    this.showAppBar = true,
    this.useSafeArea = true,
    this.enableFocus = true,
    this.padding,
    this.bottomNavigationBar,
    this.enableDefaultPadding = false,
  }) : assert(showAppBar || (appBar == null || appBarTitle == null));

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Color? scaffoldBackgroundColor;
  final bool resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final PopInvokedWithResultCallback? onPopInvokedWithResult;
  final bool? canPop;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final String? appBarTitle;
  final List<Widget>? appBarActions;
  final Widget? appBarLeading;
  final TextStyle? titleTextStyle;
  final double? elevation;
  final Color? backgroundColor;
  final bool showAppBar;
  final bool useSafeArea;
  final bool enableFocus;
  final EdgeInsets? padding;
  final Widget? bottomNavigationBar;
  final bool enableDefaultPadding;

  /// Default padding value for screens
  static const double defaultScreenPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: theme.brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: theme.brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
      child: PopScope(
        onPopInvokedWithResult: onPopInvokedWithResult,
        canPop: canPop ?? true,
        child: Scaffold(
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          backgroundColor:
              scaffoldBackgroundColor ?? injectedAppColors.background,
          bottomNavigationBar: bottomNavigationBar,
          appBar: showAppBar
              ? appBar ??
                    (appBarTitle != null
                        ? AppAppBar(
                            title: appBarTitle!,
                            actions: appBarActions,
                            leading: appBarLeading,
                            elevation: elevation ?? 0,
                            backgroundColor: backgroundColor,
                          )
                        : null)
              : null,
          body: GestureDetector(
            onTap: !enableFocus
                ? null
                : () => FocusManager.instance.primaryFocus?.unfocus(),
            child: showAppBar
                ? Padding(
                    padding:
                        padding ??
                        (enableDefaultPadding
                            ? const EdgeInsets.all(defaultScreenPadding)
                            : EdgeInsets.zero),
                    child: child,
                  )
                : useSafeArea
                ? SafeArea(
                    child: Padding(
                      padding:
                          padding ??
                          (enableDefaultPadding
                              ? const EdgeInsets.all(defaultScreenPadding)
                              : EdgeInsets.zero),
                      child: child,
                    ),
                  )
                : Padding(
                    padding:
                        padding ??
                        (enableDefaultPadding
                            ? const EdgeInsets.all(defaultScreenPadding)
                            : EdgeInsets.zero),
                    child: child,
                  ),
          ),
        ),
      ),
    );
  }
}
