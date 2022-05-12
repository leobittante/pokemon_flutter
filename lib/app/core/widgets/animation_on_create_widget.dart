import 'package:flutter/material.dart';

class AnimationOnCreateWidget extends StatefulWidget {
  final Widget widget;
  final Duration? duration;
  const AnimationOnCreateWidget({
    Key? key,
    required this.widget,
    this.duration,
  }) : super(key: key);

  @override
  State<AnimationOnCreateWidget> createState() =>
      _AnimationOnCreateWidgetState();
}

class _AnimationOnCreateWidgetState extends State<AnimationOnCreateWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation opacityAnimation;

  @override
  void initState() {
    super.initState();
    animationControls();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return Opacity(opacity: opacityAnimation.value, child: widget.widget);
      },
    );
  }

  animationControls() {
    animationController = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 400));

    opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.4),
      ),
    );

    animationController.addStatusListener((status) {
      if (animationController.value > 0.1) {
        animationController.reverse();
      }
    });
  }
}
