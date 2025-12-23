import 'package:get/get.dart';

class NavBarController extends GetxController {
  // Observable for current index
  final RxInt currentIndex = 0.obs;

  // Observable for action button state
  final RxBool isActionButtonActive = false.obs;

  // Function to handle bottom bar tap
  void onBottomBarTap(int index) {
    currentIndex.value = index;
    isActionButtonActive.value = false;
  }

  // Function to handle action button (center FAB) tap
  void onTapActionButton() {
    isActionButtonActive.value = true;
    // Optional: You can add additional logic here
  }

  // Reset to home
  void resetToHome() {
    currentIndex.value = 0;
    isActionButtonActive.value = false;
  }

  // Check if a specific tab is active
  bool isTabActive(int index) {
    return currentIndex.value == index && !isActionButtonActive.value;
  }
}