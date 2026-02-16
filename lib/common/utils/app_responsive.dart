import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppResponsive extends StatefulWidget {
  final Widget child;

  const AppResponsive({super.key, required this.child});

  @override
  State<AppResponsive> createState() => _AppResponsiveState();
}

class _AppResponsiveState extends State<AppResponsive> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: AppResponsiveWidget(scale: 1, child: widget.child),
        );
      },
    );
  }
}

class AppResponsiveWidget extends StatelessWidget {
  final Widget? child;
  final double scale;

  const AppResponsiveWidget({
    super.key,
    this.child,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.topLeft,
      scale: scale,
      child: child,
    );
  }
}
