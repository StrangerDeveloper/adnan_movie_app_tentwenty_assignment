import 'package:adnan_movie_app_tentwenty_assignment/src/features/home/presentation/view_models/bottom_navigation_view_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/home/presentation/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:provider/provider.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarViewModel>(
      builder: (_, bottomNavBarViewModel, _) {
        return ValueListenableBuilder<int>(
          valueListenable: bottomNavBarViewModel.bottomNavBarIndex,
          builder: (_, index, _) {
            return Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              alignment: AlignmentDirectional.center,
              height: 55,
              decoration: BoxDecoration(
                //color: injectedAppColors.genreBlue,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: injectedAppColors.greyColor.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Theme(
                data: ThemeData(splashColor: Colors.transparent),
                child: BottomNavigationBar(
                  currentIndex: index,
                  onTap: bottomNavBarViewModel.changeBottomNavBarView,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: injectedAppColors.primary,
                  selectedItemColor: injectedAppColors.selectedItemColor,
                  unselectedItemColor: injectedAppColors.unSelectedItemColor,
                  selectedLabelStyle: injectedTextStyles.regular10.copyWith(fontWeight: FontWeight.w600),
                  unselectedLabelStyle: injectedTextStyles.regular8,
                  items: List.generate(bottomNavBarViewModel.navigationBarItems.length, (i) {
                    final item = bottomNavBarViewModel.navigationBarItems[i];
                    return buildNavigationBarItem(iconPath: item.iconPath, label: item.label, isActive: i == index);
                  }),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
