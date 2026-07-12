import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../core/constants/app_animations.dart';

/// Triggers a fade + slide-up animation when the widget scrolls into view.
/// Uses [VisibilityDetector] so it fires once on first appearance.
class AnimatedVisibility extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset beginOffset;

  const AnimatedVisibility({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = AppAnimations.entrance,
    this.beginOffset = const Offset(0, 32),
  });

  @override
  State<AnimatedVisibility> createState() => _AnimatedVisibilityState();
}

class _AnimatedVisibilityState extends State<AnimatedVisibility>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  bool _triggered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _fade = CurvedAnimation(parent: _controller, curve: AppAnimations.smoothCurve);
    _slide = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: AppAnimations.smoothCurve));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_triggered && info.visibleFraction > 0.05) {
      _triggered = true;
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key ?? UniqueKey(),
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => FadeTransition(
          opacity: _fade,
          child: Transform.translate(
            offset: _slide.value,
            child: child,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}

/// Staggered version — wraps a list of children with increasing delays.
class StaggeredAnimatedVisibility extends StatelessWidget {
  final List<Widget> children;
  final Duration stagger;
  final Duration duration;

  const StaggeredAnimatedVisibility({
    super.key,
    required this.children,
    this.stagger = AppAnimations.stagger,
    this.duration = AppAnimations.entrance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < children.length; i++)
          AnimatedVisibility(
            delay: stagger * i,
            duration: duration,
            child: children[i],
          ),
      ],
    );
  }
}
