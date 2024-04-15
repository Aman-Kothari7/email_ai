import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const ContainerCard({required this.child, this.padding, this.margin, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: padding ?? const EdgeInsets.all(18),
        margin: margin ?? const EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            )),
        child: child);
  }
}
