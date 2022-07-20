import 'package:flutter/material.dart';

class Paper extends StatelessWidget {

  final Widget child;
  final Color? color;
  final double? padding;
  final double? border;

  const Paper({
    Key? key, 
    required this.child,
    this.color,
    this.padding,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border ?? 10),
        color: color ??Colors.white,
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 20.0),
        child: child
      ),
    );
  }
}