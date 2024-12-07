import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opvoedmaatje/view/chat_screen.dart';
import '../view_model/home_viewmodel.dart';
import 'history_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the HomeScreenViewModel instance
    final HomeScreenViewModel homeScreenViewModel = Get.put(HomeScreenViewModel());

    return Scaffold(
      body: Obx(() {
        // Display the selected screen based on currentIndex
        return homeScreenViewModel.currentIndex.value == 0
            ? ChatScreen()
            : HistoryScreen();
      }),
      bottomNavigationBar: Obx(() {
        // Update BottomNavigationBar based on the current index
        return BottomNavigationBar(
          currentIndex: homeScreenViewModel.currentIndex.value,
          onTap: (index) {
            // Use the ViewModel to update the index
            homeScreenViewModel.updateIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
          ],
        );
      }),
    );
  }
}
