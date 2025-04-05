import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'
    show LaunchMode, canLaunchUrl, launchUrl;
import 'package:thansira_travels/core/theme/colors.dart';
import 'package:thansira_travels/core/theme/text_styles.dart';
import 'package:thansira_travels/core/theme/constants.dart';
import '../core/widgets/app_drawer.dart';
import 'homepage.dart';
import 'aboutUs.dart';
import 'contactUs.dart';

class StudentTour extends StatefulWidget {
  const StudentTour({super.key});

  @override
  State<StudentTour> createState() => _StudentTourState();
}

class _StudentTourState extends State<StudentTour>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _drawerController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  void toggleDrawer() {
    if (_drawerController.isCompleted) {
      _drawerController.reverse();
    } else {
      _drawerController.forward();
    }
  }

  void _handleNavigation(BuildContext context, String route) {
    switch (route) {
      case 'Home':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
        break;
      case 'About Us':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Aboutus()),
        );
        break;
      case 'Contact Us':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Contactus()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Student Tours',
              style: subtitle.copyWith(
                color: white,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isMobile)
              IconButton(
                icon: Icon(Icons.menu, color: white),
                onPressed: toggleDrawer,
              ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/fitadvisor-flutter.appspot.com/o/collegeTour.webp?alt=media&token=674a2539-dbc0-41b2-8e10-fc68925e3f0b",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Student Tour Packages',
                        style: title.apply(color: blue),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Vacation in India in itself is a great experience, and when it is accompanied by some theme, We offer you an enthusiastic, excitement filled trip for students & youths to know the beauty of our country.',
                        style: subtitle.copyWith(fontSize: 16, height: 1.5),
                      ),
                      const SizedBox(height: 30),
                      _buildTourPackage(
                        'Kodaikanal Tour',
                        '2 Days',
                        '₹24,000',
                        [
                          'Visit to Coaker\'s Walk',
                          'Pillar Rocks',
                          'Green Valley View',
                          'Kurinji Andavar Temple',
                          'Silver Cascade Falls',
                        ],
                      ),
                      const SizedBox(height: 30),
                      _buildTourPackage('Ooty Tour', '2 Days', '₹28,000', [
                        'Botanical Gardens',
                        'Ooty Lake',
                        'Doddabetta Peak',
                        'Rose Garden',
                        'Tea Factory Visit',
                      ]),
                      const SizedBox(height: 30),
                      _buildTourPackage(
                        'Munnar & Kanthalloor Tour',
                        '2 Days',
                        '₹30,000',
                        [
                          'Eravikulam National Park',
                          'Tea Museum',
                          'Mattupetty Dam',
                          'Echo Point',
                          'Kanthalloor Farm Visit',
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Important Information',
                              style: subtitle.copyWith(
                                color: blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '• Package prices are excluding Food and Room\n'
                              '• 4 to 52 Seats Vehicles Available\n'
                              '• All packages include transportation and guide\n'
                              '• Customizable itineraries available\n'
                              '• Group discounts available',
                              style: subtitle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isMobile)
            AppDrawer(
              onClose: toggleDrawer,
              animation: _animation,
              currentPage: 'Student Tours',
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "whatsapp_student",
            backgroundColor: Colors.transparent,
            onPressed: () async {
              const String phoneNumber = "8680878612";
              final Uri url = Uri.parse("https://wa.me/$phoneNumber");
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            child: Image.asset("assets/images/whatsapp.webp"),
          ),
          const SizedBox(height: 10),
          (isMobile || isTablet)
              ? FloatingActionButton(
                heroTag: "call_student",
                backgroundColor: Colors.green,
                onPressed: () async {
                  const String phoneNumber = "tel:8680878612";
                  final Uri url = Uri.parse(phoneNumber);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: const Icon(Icons.call, color: Colors.white),
              )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTourPackage(
    String title,
    String duration,
    String price,
    List<String> highlights,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: subtitle.copyWith(
                  color: blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                duration,
                style: subtitle.copyWith(color: grey, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            price,
            style: subtitle.copyWith(
              color: lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Highlights:',
            style: subtitle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          ...highlights.map(
            (highlight) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: lightBlue, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      highlight,
                      style: subtitle.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
