import 'package:flutter/material.dart';
import 'package:thansira_travels/core/theme/colors.dart';
import 'package:thansira_travels/core/theme/text_styles.dart';
import 'package:thansira_travels/core/theme/constants.dart';
import 'package:thansira_travels/core/widgets/footer_section.dart';
import 'package:thansira_travels/core/widgets/app_drawer.dart';
import 'package:thansira_travels/screens/homepage.dart';
import 'package:thansira_travels/screens/contactUs.dart';
import 'package:url_launcher/url_launcher.dart'
    show LaunchMode, canLaunchUrl, launchUrl;

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> with SingleTickerProviderStateMixin {
  String? hoveredNavItem;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void toggleDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      isDrawerOpen ? _controller.forward() : _controller.reverse();
    });
  }

  void launchWhatsApp() async {
    const String phoneNumber = "8680878612";
    final Uri url = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch WhatsApp");
    }
  }

  void makeCall() async {
    const String phoneNumber = "tel:8680878612";
    final Uri url = Uri.parse(phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint("Could not make the call");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "THANSIRA\nTRAVELS",
              style: title.copyWith(
                fontFamily: 'poorStory',
                letterSpacing: 2,
                color: white,
              ),
              textAlign: TextAlign.center,
            ),
            if (!isMobile)
              Row(
                children:
                    ["Home", "About Us", "Contact Us"]
                        .map(
                          (navItem) => MouseRegion(
                            onEnter:
                                (_) => setState(() {
                                  hoveredNavItem = navItem;
                                }),
                            onExit:
                                (_) => setState(() {
                                  hoveredNavItem = null;
                                }),
                            child: InkWell(
                              onTap: () => _handleNavigation(context, navItem),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 200),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        hoveredNavItem == navItem
                                            ? lightBlue
                                            : white,
                                  ),
                                  child: Text(navItem),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            if (isMobile)
              IconButton(
                icon: Icon(
                  isDrawerOpen ? Icons.close : Icons.menu,
                  color: white,
                ),
                onPressed: toggleDrawer,
              ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Hero Section
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/TNtour.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'About Us',
                            style: title.copyWith(
                              color: white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Your Trusted Travel Partner in Tamil Nadu & Pondicherry',
                            style: subtitle.copyWith(
                              color: white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Content Sections
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : screenWidth * 0.1,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // About Section
                      _buildSection(
                        Title: 'Who We Are',
                        content:
                            'Thansira Travels is a premier travel agency based in Pondicherry, specializing in comprehensive tour packages across Tamil Nadu, Pondicherry and South India. With years of experience in the tourism industry, we have established ourselves as a trusted name in providing exceptional travel experiences to our valued customers.',
                      ),
                      sBoxH30,

                      // Mission Section
                      _buildSection(
                        Title: 'Our Mission',
                        content:
                            'Our mission is to provide unforgettable travel experiences while maintaining the highest standards of customer service. We strive to showcase the rich cultural heritage, natural beauty, and spiritual significance of Tamil Nadu and Pondicherry to travelers from around the world.',
                      ),
                      sBoxH30,

                      // Services Grid
                      Text('Our Services', style: title.copyWith(color: blue)),
                      sBoxH20,
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount:
                            isMobile
                                ? 1
                                : isTablet
                                ? 2
                                : 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.8,
                        children: [
                          _buildServiceCard(
                            icon: Icons.temple_buddhist,
                            title: 'Temple Tours',
                            description:
                                'Experience spiritual journeys to ancient temples across Tamil Nadu and Pondicherry with our expert guides. Discover the rich heritage and divine atmosphere of sacred sites.',
                          ),
                          _buildServiceCard(
                            icon: Icons.car_rental,
                            title: 'Car Rentals',
                            description:
                                'Choose from our fleet of well-maintained vehicles with professional drivers. We ensure comfortable and safe transportation for all your travel needs.',
                          ),
                          _buildServiceCard(
                            icon: Icons.school,
                            title: 'Educational Tours',
                            description:
                                'Specially designed learning experiences at historical sites for students. Our educational tours combine knowledge with exploration of cultural landmarks.',
                          ),
                          _buildServiceCard(
                            icon: Icons.holiday_village,
                            title: 'Holiday Packages',
                            description:
                                'Customized vacation packages for families and groups with handpicked destinations. Enjoy comfortable stays and carefully planned itineraries.',
                          ),
                          _buildServiceCard(
                            icon: Icons.airport_shuttle,
                            title: 'Airport Transfers',
                            description:
                                'Reliable pickup and drop services to and from airports. Our punctual service ensures stress-free travel with comfortable vehicles and experienced drivers.',
                          ),
                          _buildServiceCard(
                            icon: Icons.tour,
                            title: 'Local Sightseeing',
                            description:
                                'Our experienced guides will take you through the best tourist spots and hidden gems of Tamil Nadu and Pondicherry.',
                          ),
                        ],
                      ),
                      sBoxH30,

                      // Why Choose Us
                      Text('Why Choose Us', style: title.copyWith(color: blue)),
                      sBoxH20,
                      Column(
                        children: [
                          _buildFeature(
                            icon: Icons.verified_user,
                            title: 'Experienced Team',
                            description:
                                'Our team consists of experienced travel professionals.',
                          ),
                          _buildFeature(
                            icon: Icons.price_check,
                            title: 'Competitive Pricing',
                            description:
                                'Best value for money with transparent pricing.',
                          ),
                          _buildFeature(
                            icon: Icons.support_agent,
                            title: '24/7 Support',
                            description:
                                'Round-the-clock customer support for your convenience.',
                          ),
                          _buildFeature(
                            icon: Icons.star,
                            title: 'Customized Services',
                            description:
                                'Tailored travel solutions to meet your specific needs.',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Footer
                const FooterSection(),
              ],
            ),
          ),
          if (isMobile)
            AppDrawer(
              onClose: toggleDrawer,
              animation: _animation,
              currentPage: 'About Us',
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "whatsapp_about",
            backgroundColor: Colors.transparent,
            onPressed: launchWhatsApp,
            child: Image.asset("assets/images/whatsapp.png"),
          ),
          const SizedBox(height: 10),
          (isMobile || isTablet)
              ? FloatingActionButton(
                heroTag: "call_about",
                backgroundColor: Colors.green,
                onPressed: makeCall,
                child: const Icon(Icons.call, color: Colors.white),
              )
              : Container(),
        ],
      ),
    );
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
        // Already on About Us page
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSection({required String Title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Title, style: title.copyWith(color: blue)),
        sBoxH20,
        Text(content, style: subtitle.copyWith(height: 1.6)),
      ],
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: blue),
          const SizedBox(height: 4),
          Text(
            title,
            style: subtitle.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: subtitle.copyWith(
              fontSize: 14,
              height: 1.2,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeature({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: blue, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: subtitle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(description, style: subtitle.copyWith(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
