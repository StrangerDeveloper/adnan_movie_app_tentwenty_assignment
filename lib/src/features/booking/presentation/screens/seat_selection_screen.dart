import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_change_notifier_provider.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/booking/presentation/view_models/seat_selection_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_widget.dart';
import '../views/seat_selection_view.dart';

class SeatSelectionScreen extends StatelessWidget {
  const SeatSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifierProvider<SeatSelectionViewModel>(
      create: (_)=> SeatSelectionViewModel(),
      builder: (context, viewModel) {
        return BaseWidget(
          appBarTitle: injectedAppTranslationKeys.selectSeats.translate,
          appBarLeading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => context.pop(),
          ),
          child: SeatSelectionView(
            viewModel: viewModel,
            onProceed: () {
              // Navigate to payment or show success
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    injectedAppTranslationKeys.bookingConfirmed.translate,
                  ),
                ),
              );
              context.pop();
            },
          ),
        );
      }
    );
  }
}
