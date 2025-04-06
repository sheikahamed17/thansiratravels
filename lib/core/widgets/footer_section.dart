import 'package:flutter/material.dart';
import 'package:thansira_travels/core/theme/constants.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:thansira_travels/screens/homepage.dart';
import 'package:thansira_travels/screens/aboutUs.dart';
import 'package:thansira_travels/screens/contactUs.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  void _handleNavigation(BuildContext context, String route) {
    switch (route) {
      case 'Home':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
        break;
      case 'About Us':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Aboutus()),
        );
        break;
      case 'Contact Us':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Contactus()),
        );
        break;
    }
  }

  Future<void> _launchInstagram() async {
    const url =
        'https://www.instagram.com/thansira_holidays_?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      color: blue,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.1,
        vertical: 20,
      ),
      child: Column(
        children: [
          isMobile
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAboutUs(),
                  sBoxH30,
                  _buildQuickLinks(),
                  sBoxH30,
                  _buildTouristPlaces(),
                  sBoxH30,
                  _buildContactUs(),
                ],
              )
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildAboutUs()),
                  const SizedBox(width: 40),
                  Expanded(child: _buildQuickLinks()),
                  //const SizedBox(width: 40),
                  Expanded(child: _buildTouristPlaces()),
                  const SizedBox(width: 40),
                  Expanded(child: _buildContactUs()),
                ],
              ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white24),
          const SizedBox(height: 20),
          Text(
            'Copyrights © 2025. Thansira Travels All Rights Reserved.',
            style: subtitle.copyWith(
              color: white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('ABOUT US'),
        const SizedBox(height: 20),
        Text(
          'Tamil Nadu and Pondicherry, the Gateway to the south, is the land of Tamils and heart land of Southern India. Tamil Nadu smells of sacrificial burning camphor and the perfume from jasmine garlands piled up before its beautifully carved granite gods, while Pondicherry offers a unique blend of French colonial heritage and Indian culture.',
          style: subtitle.copyWith(color: white.withOpacity(0.7), height: 1.6),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            for (final icon in ['insta'])
              InkWell(
                onTap: _launchInstagram,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset(
                      'assets/images/social/$icon.png',
                      height: 50,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickLinks() {
    return Builder(
      builder:
          (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('QUICK LINKS'),
              const SizedBox(height: 20),
              for (final link in ['Home', 'Contact Us', 'About Us'])
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () => _handleNavigation(context, link),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text(
                        link,
                        style: subtitle.copyWith(
                          color: white.withOpacity(0.7),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
    );
  }

  Widget _buildTouristPlaces() {
    final places = [
      ['Kanyakumari', 'Ooty', 'Dindugal', 'Kancheepuram'],
      ['Chennai', 'Rameshwaram', 'Kodaikanal', 'Coimbatore'],
      ['Navagram', 'Navathirupathi', 'Tuticorin', 'Tirunelveli'],
      ['Tenkasi', 'Madurai', 'Theni', 'Trichy'],
      ['Tanjore', 'Kumbakonam', 'Tiruvaarur'],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('TOURIST PLACES'),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 20,
          runSpacing: 12,
          children:
              places.expand((column) => column).map((place) {
                return Text(
                  place,
                  style: subtitle.copyWith(
                    color: white.withOpacity(0.7),
                    fontSize: 15,
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildContactUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('CONTACT US'),
        const SizedBox(height: 20),
        Text(
          'Thansira Travels\n'
          'Villianur, Pondicherry\n\n'
          'Pondicherry, India\n\n'
          'Phone: +91 8680878612\n'
          'Email: info@thansiratravels.com',
          style: subtitle.copyWith(
            color: white.withOpacity(0.7),
            height: 1.6,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: subtitle.copyWith(
            color: white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(width: 50, height: 2, color: white),
      ],
    );
  }
}
