import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/app_button.dart';

import '../view_models/seat_selection_view_model.dart';

class BookingSummary extends StatelessWidget {
  final SeatSelectionViewModel viewModel;
  final VoidCallback onProceed;

  const BookingSummary({
    super.key,
    required this.viewModel,
    required this.onProceed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: injectedAppColors.surface,
        boxShadow: [
          BoxShadow(
            color: injectedAppColors.shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (viewModel.selectedSeats.isNotEmpty) ...[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: viewModel.selectedSeats.map((seat) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: injectedAppColors.lightGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(seat.id, style: injectedTextStyles.regular12),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          viewModel.toggleSeatSelection(seat.row, seat.column);
                        },
                        child: Icon(
                          Icons.close,
                          size: 16,
                          color: injectedAppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    injectedAppTranslationKeys.total.translate,
                    style: injectedTextStyles.regular12.copyWith(
                      color: injectedAppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$ ${viewModel.totalPrice}',
                    style: injectedTextStyles.semiBold16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: injectedAppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: AppButton(
                    text: injectedAppTranslationKeys.proceedToPayment.translate,
                    onPressed: viewModel.canProceed() ? onProceed : null,
                    backgroundColor: injectedAppColors.regularSeatColor,
                    textColor: injectedAppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
