import 'package:flutter/material.dart';
import '../app_colors.dart';


class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  ReusableAppBar({
    super.key,
    required this.titleText,
    this.leading,
    this.centerTitle = false,
    this.actions,
    this.enableBack = false,
    this.appBarTitle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String titleText;
  bool centerTitle;
  List<Widget>? actions;
  bool enableBack;
  Widget? leading;
  Widget? appBarTitle;

  final Widget _backButton = IconButton(
      onPressed: (){
        // Get.back();//TODO: add pop logic
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      )
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: enableBack? _backButton : leading,
      centerTitle: centerTitle,
      title: appBarTitle ?? Text(
          titleText,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white
          )
      ),
      actions: actions,
    );
  }
}
