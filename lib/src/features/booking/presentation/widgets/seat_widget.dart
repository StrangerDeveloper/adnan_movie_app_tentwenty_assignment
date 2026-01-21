import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import '../view_models/seat_selection_view_model.dart';

class SeatWidget extends StatelessWidget {
  final Seat seat;
  final VoidCallback onTap;

  const SeatWidget({super.key, required this.seat, required this.onTap});

  Color _getSeatColor(SeatStatus status) {
    switch (status) {
      case SeatStatus.available:
        return seat.type == SeatType.vip
            ? injectedAppColors.vipSeatColor
            : injectedAppColors.regularSeatColor;
      case SeatStatus.selected:
        return injectedAppColors.selectedSeatColor;
      case SeatStatus.occupied:
        return injectedAppColors.notAvailableSeatColor;
      case SeatStatus.disabled:
        return injectedAppColors.notAvailableSeatColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled =
        seat.status != SeatStatus.occupied &&
        seat.status != SeatStatus.disabled;

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: _getSeatColor(seat.status),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: seat.status == SeatStatus.selected
                ? injectedAppColors.selectedSeatColor
                : injectedAppColors.border.withValues(alpha: 0.3),
            width: seat.status == SeatStatus.selected ? 2 : 1,
          ),
        ),
      ),
    );
  }
}
