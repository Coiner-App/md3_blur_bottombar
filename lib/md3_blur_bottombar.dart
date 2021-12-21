library blur_bottom_bar;

import 'dart:ui';
import 'package:flutter/material.dart';

/// Material Design 3 (MD you) style bottom bar with blur behind
class MD3BlurBottomView extends StatelessWidget {
  final bool showLabels;
  final bool showUnselectedLabels;
  final VoidCallback? onClick;
  final double filterX;
  final double filterY;
  final double opacity;
  final double height;
  final Color backgroundColor;
  final int selectedIndex;
  final List<NavigationDestination> bottomNavigationBarItems;
  final Function(int) onIndexChange;

  const MD3BlurBottomView(
      {Key? key,
      this.showLabels = true,
      this.showUnselectedLabels = false,
      this.onClick,
      this.filterX = 10.0,
      this.filterY = 15.0,
      this.opacity = 0.5,
      this.height = 80.0,
      this.backgroundColor = Colors.black,
      this.selectedIndex = 0,
      required this.onIndexChange,
      required this.bottomNavigationBarItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Align(
          alignment: Alignment.bottomCenter,
          child: Divider(
            height: 1,
            thickness: 2,
            indent: 0.0,
            endIndent: 0.0,
            color: Color(0x0FFFFFFF),
          ),
        ),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: filterX,
              sigmaY: filterY,
            ),
            child: Opacity(
              opacity: opacity,
              child: NavigationBar(
                height: height,
                labelBehavior: showLabels
                    ? showUnselectedLabels
                        ? NavigationDestinationLabelBehavior.alwaysShow
                        : NavigationDestinationLabelBehavior.onlyShowSelected
                    : NavigationDestinationLabelBehavior.alwaysHide,
                backgroundColor: backgroundColor,
                destinations: bottomNavigationBarItems,
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  onIndexChange(index);
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}