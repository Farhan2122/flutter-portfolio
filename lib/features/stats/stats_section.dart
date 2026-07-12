import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive_helper.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  static const _stats = [
    (value: '1+', label: 'Years Experience', icon: Icons.work_outline_rounded),
    (value: '3+', label: 'Apps Shipped', icon: Icons.phone_android_rounded),
    (
      value: '25+',
      label: 'Features Delivered',
      icon: Icons.check_circle_outline_rounded,
    ),
    (value: '100%', label: 'Passion', icon: Icons.favorite_outline_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Container(
      width: double.infinity,
      color: AppColors.accent,
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 80 : 60,
        horizontal: isDesktop
            ? AppDimensions.pagePaddingDesktop
            : AppDimensions.pagePaddingMobile,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppDimensions.maxContentWidth,
          ),
          child: isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < _stats.length; i++)
                      Expanded(
                        child: _StatItem(
                          value: _stats[i].value,
                          label: _stats[i].label,
                          icon: _stats[i].icon,
                          delay: Duration(milliseconds: i * 150),
                        ),
                      ),
                  ],
                )
              : Wrap(
                  spacing: 24,
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < _stats.length; i++)
                      SizedBox(
                        width: 140,
                        child: _StatItem(
                          value: _stats[i].value,
                          label: _stats[i].label,
                          icon: _stats[i].icon,
                          delay: Duration(milliseconds: i * 150),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _StatItem extends StatefulWidget {
  final String value;
  final String label;
  final IconData icon;
  final Duration delay;

  const _StatItem({
    required this.value,
    required this.label,
    required this.icon,
    required this.delay,
  });

  @override
  State<_StatItem> createState() => _StatItemState();
}

class _StatItemState extends State<_StatItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _triggered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('stat-${widget.label}'),
      onVisibilityChanged: (info) {
        if (!_triggered && info.visibleFraction > 0.1) {
          _triggered = true;
          Future.delayed(widget.delay, () {
            if (mounted) _controller.forward();
          });
        }
      },
      child: Column(
        children: [
          Icon(widget.icon, color: Colors.white.withOpacity(0.8), size: 28)
              .animate(controller: _controller)
              .fadeIn(duration: 400.ms)
              .scale(
                begin: const Offset(0.5, 0.5),
                end: const Offset(1, 1),
                duration: 500.ms,
                curve: Curves.easeOutBack,
              ),

          const SizedBox(height: 12),

          Text(
                widget.value,
                style: AppTextStyles.statNumber.copyWith(color: Colors.white),
              )
              .animate(controller: _controller)
              .fadeIn(duration: 600.ms, curve: Curves.easeOut)
              .scale(
                begin: const Offset(0.7, 0.7),
                end: const Offset(1, 1),
                duration: 600.ms,
                curve: Curves.easeOutQuart,
              ),

          const SizedBox(height: 8),

          Text(
                widget.label,
                style: AppTextStyles.statLabel.copyWith(
                  color: Colors.white.withOpacity(0.75),
                ),
                textAlign: TextAlign.center,
              )
              .animate(controller: _controller)
              .fadeIn(delay: 200.ms, duration: 500.ms),
        ],
      ),
    );
  }
}
