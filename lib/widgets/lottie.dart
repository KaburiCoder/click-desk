import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  final String name;
  final int duration;
  final bool forward;

  const LottieAnimation(this.name,
      {super.key, this.duration = 1000, this.forward = false});

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    if (widget.forward) {
      _controller.forward();
    } else {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(widget.name, controller: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}