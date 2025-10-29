import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';

class CustomCategoryTabBar extends StatefulWidget {
  final List<String> categories;
  final Function(int) onCategorySelected;
  final int initialIndex;

  const CustomCategoryTabBar({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<CustomCategoryTabBar> createState() => _CustomCategoryTabBarState();
}

class _CustomCategoryTabBarState extends State<CustomCategoryTabBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onCategorySelected(index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.denimBlueColor : AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.denimBlueColor
                        : AppTheme.glacierGrayColor,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.categories[index],
                    style: TextStyle(
                      fontFamily: "Outfit",
                      color: isSelected
                          ? AppTheme.whiteColor
                          : AppTheme.charcoalBlueColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}