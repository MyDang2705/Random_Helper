// lib/presentation/pages/main_dashboard.dart
import 'package:flutter/material.dart';
import '../../core/utils/theme.dart';
import 'home_page.dart';
import 'suggestions_page.dart';
import 'favorite_spins_page.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _selectedIndex = 0;
  final GlobalKey _favoritePageKey = GlobalKey();

  List<Widget> get _pages => [
    const HomePage(),
    FavoriteSpinsPage(key: _favoritePageKey),
    const SuggestionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            // Reload favorite page khi chuyển sang tab yêu thích
            if (index == 1) {
              final state = _favoritePageKey.currentState;
              if (state != null) {
                // Gọi method reload thông qua dynamic
                try {
                  (state as dynamic).reload();
                } catch (_) {
                  // Ignore nếu không có method reload
                }
              }
            }
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.softText,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Theme.of(context).cardColor,
          elevation: 8,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.casino),
              activeIcon: Icon(Icons.casino),
              label: 'Vòng quay của tôi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: 'Yêu thích',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
              activeIcon: Icon(Icons.lightbulb),
              label: 'Gợi ý vòng quay',
            ),
          ],
        ),
      ),
    );
  }
}
