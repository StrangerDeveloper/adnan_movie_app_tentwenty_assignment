import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';

class SeatLegend extends StatelessWidget {
  const SeatLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 16,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: [
          _LegendItem(
            color: injectedAppColors.selectedSeatColor,
            label: injectedAppTranslationKeys.selected.translate,
          ),
          _LegendItem(
            color: injectedAppColors.vipSeatColor,
            label: 'VIP (150\$)',
          ),
          _LegendItem(
            color: injectedAppColors.notAvailableSeatColor,
            label: injectedAppTranslationKeys.occupied.translate,
          ),
          _LegendItem(
            color: injectedAppColors.regularSeatColor,
            label: 'Regular (50 \$)',
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: injectedAppColors.border.withValues(alpha: 0.3),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: injectedTextStyles.regular12),
      ],
    );
  }
}
