import 'package:flutter/material.dart';
import '../../widgets/half_circle_indicator.dart';

class HomeBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const HomeBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 7, left: 20, right: 20, top: 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        
        border: Border(top: BorderSide(color: Color(0xFF2C2D31), width: 1)),
        color: Color(0xFF1A1A1A),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem('assets/icons/home.png', 'Home', 0),
          _buildNavItem('assets/icons/news.png', 'News', 1),
          _buildNavItem('assets/icons/trackbox.png', 'TrackBox', 2),
          _buildNavItem('assets/icons/projects.png', 'Projects', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    bool isActive = selectedIndex == index;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        onTap: () => onItemSelected(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isActive )
              HalfCircleIndicator(color: Colors.white, radius: 5.5),
                
            const SizedBox(height: 6.5),
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
              color: isActive ? Colors.white : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}