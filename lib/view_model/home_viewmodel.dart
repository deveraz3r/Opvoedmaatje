import 'package:get/get.dart';

class HomeScreenViewModel extends GetxController {
  // Reactive variable to manage the current selected index
  Rx<int> currentIndex = 0.obs;

  // Method to change the index
  void updateIndex(int index) {
    currentIndex.value = index;
  }

}
