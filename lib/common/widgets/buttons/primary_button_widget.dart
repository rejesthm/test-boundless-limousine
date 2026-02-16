// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    required this.children,
    required this.canonicalButtonName,
    required this.onPressed,
    this.routeName,
    this.buttonId,
    this.extras,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.isLoading,
    super.key,
  });

  final List<Widget> children;

  final String canonicalButtonName;

  final String? routeName;

  final String? buttonId;

  final Map<String, dynamic>? extras;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final ValueChanged<bool>? onHover;

  final ValueChanged<bool>? onFocusChange;

  final ButtonStyle? style;

  final FocusNode? focusNode;

  final bool autofocus;

  final Clip clipBehavior;

  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      key: key,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (isLoading ?? false)
              ? const [CupertinoActivityIndicator()]
              : children,
        ),
      ),
    );
  }
}
