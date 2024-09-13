import 'package:flutter/material.dart';

class MobileParagraphContainer extends StatelessWidget { //Отступы
  const MobileParagraphContainer({
    super.key,
    required this.child
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: SizedBox(
        height: 20,
        child: Center(
          child: child,),
      )
    );
  }
}