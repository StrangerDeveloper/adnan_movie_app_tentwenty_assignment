import 'package:adnan_movie_app_tentwenty_assignment/src/features/booking/presentation/view_models/seat_selection_view_model.dart';
import 'package:flutter/material.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import '../widgets/booking_summary.dart';
import '../widgets/seat_legend.dart';
import '../widgets/seat_widget.dart';

class SeatSelectionView extends StatelessWidget {
  final VoidCallback onProceed;
  final SeatSelectionViewModel viewModel;

  const SeatSelectionView({
    super.key,
    required this.onProceed,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Screen indicator
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: injectedAppColors.greyColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              injectedAppTranslationKeys.screen.translate,
              style: injectedTextStyles.medium14.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
          ),
        ),
        // Seat grid
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // Row labels
                ...viewModel.seats.asMap().entries.map((entry) {
                  final rowIndex = entry.key;
                  final row = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        // Row label
                        SizedBox(
                          width: 16,
                          child: Text(
                            '${rowIndex + 1}',
                            style: injectedTextStyles.regular10.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Seats
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: row.asMap().entries.map((colEntry) {
                              final colIndex = colEntry.key;
                              final seat = colEntry.value;
                              return SeatWidget(
                                seat: seat,
                                onTap: () => viewModel.toggleSeatSelection(
                                  rowIndex,
                                  colIndex,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 16),
                // Column labels
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      viewModel.seats.isNotEmpty
                          ? viewModel.seats[0].length
                          : 0,
                      (index) => SizedBox(
                        width: 24,
                        child: Text(
                          '${index + 1}',
                          style: injectedTextStyles.regular10.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Legend
                const SeatLegend(),
              ],
            ),
          ),
        ),
        // Booking summary
        BookingSummary(viewModel: viewModel, onProceed: onProceed),
      ],
    );
  }
}
