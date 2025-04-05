import 'package:flutter/material.dart';
import 'package:thansira_travels/core/theme/colors.dart';
import 'package:thansira_travels/core/theme/text_styles.dart';
import 'package:thansira_travels/screens/homepage.dart';
import 'package:thansira_travels/screens/aboutUs.dart';
import 'package:thansira_travels/screens/contactUs.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback onClose;
  final Animation<double> animation;
  final String currentPage;

  const AppDrawer({
    super.key,
    required this.onClose,
    required this.animation,
    required this.currentPage,
  });

  void _handleNavigation(BuildContext context, String route) {
    onClose();

    // If we're already on the selected page, just close the drawer
    if (route == currentPage) {
      return;
    }

    // Clear the navigation stack and push the new page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (route) {
            case 'Home':
              return const HomePage();
            case 'About Us':
              return const Aboutus();
            case 'Contact Us':
              return const Contactus();
            default:
              return const HomePage();
          }
        },
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Stack(
          children: [
            // Semi-transparent overlay that only closes the drawer
            if (animation.value > 0)
              Positioned.fill(
                child: GestureDetector(
                  onTap: onClose,
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color: black.withOpacity(0.5 * animation.value),
                  ),
                ),
              ),
            // Drawer content
            Positioned(
              right: 0,
              child: Transform.translate(
                offset: Offset(200 * (1 - animation.value), 0),
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 200,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: appBarColor,
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        ...[
                          "Home",
                          "About Us",
                          "Contact Us",
                        ].map((navItem) => buildDrawerItem(navItem, context)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildDrawerItem(String title, BuildContext context) {
    final isSelected = title == currentPage;
    return GestureDetector(
      onTap: () => _handleNavigation(context, title),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        color: isSelected ? blue.withOpacity(0.1) : Colors.transparent,
        child: Text(
          title,
          style: subtitle.copyWith(
            color: isSelected ? lightBlue : white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
