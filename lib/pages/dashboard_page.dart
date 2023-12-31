import 'package:flutter/material.dart';

import 'main/side_menu_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SideMenuPage(
      title: 'Dashboard',
      child: SizedBox.shrink(),
    );
  }
}
