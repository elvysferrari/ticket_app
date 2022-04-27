import 'package:flutter/material.dart';

import '../../constants/app_themes.dart';
import '../../models/menu_item_model.dart';

class NavigationBarMobile extends StatelessWidget {

  final List<MenuItemModel> menuItems;
  final int selectedTabIndex;
  final Function(int) onTap;
  final bool bottomIndicator;

  const NavigationBarMobile({
    Key? key,
    required this.menuItems,
    required this.selectedTabIndex,
    required this.onTap,
    this.bottomIndicator = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorColor: AppColors.secondary,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.secondary,
        labelStyle: const TextStyle(fontSize: 8.5, fontWeight: FontWeight.w500),
        onTap: onTap,
        indicator: BoxDecoration(
            border: bottomIndicator
                ? const Border(
              bottom: BorderSide(
                  color: AppColors.primary,
                  width: 2
              ),
            )
                : const Border(
              top: BorderSide(
                  color: AppColors.primary,
                  width: 2
              ),
            )
        ),

        tabs: menuItems.asMap().map((indice, item){
          return MapEntry(indice,
              Tab(

                text: item.iconText,
                icon: Icon(
                  item.icon,
                  color: selectedTabIndex == indice
                      ? AppColors.primary
                      : item.iconColor ,
                  size: 28,
                ),
              ));
        }).values.toList()
    );
  }
}
