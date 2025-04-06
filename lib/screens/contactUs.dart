import 'package:flutter/material.dart';
import 'package:thansira_travels/core/theme/colors.dart';
import 'package:thansira_travels/core/theme/text_styles.dart';
import 'package:thansira_travels/core/theme/constants.dart';
import 'package:thansira_travels/core/widgets/footer_section.dart';
import 'package:thansira_travels/core/widgets/app_drawer.dart';
import 'package:thansira_travels/screens/homepage.dart';
import 'package:thansira_travels/screens/aboutUs.dart';
import 'package:url_launcher/url_launcher.dart'
    show LaunchMode, canLaunchUrl, launchUrl;
import 'package:http/http.dart' as http;

class Contactus extends StatefulWidget {
  const Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus>
    with SingleTickerProviderStateMixin {
  String? hoveredNavItem;
  bool _isLoading = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isDrawerOpen = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

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
        // Already on Contact Us page
        break;
    }
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

  Future<void> _sendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Format the message
      final message = '''
New Contact Form Submission:

Name: ${_nameController.text}
Email: ${_emailController.text}
Phone: ${_phoneController.text}
Subject: ${_subjectController.text}

Message:
${_messageController.text}
''';

      // Encode the message for URL
      final encodedMessage = Uri.encodeComponent(message);

      // Create WhatsApp URL
      const String phoneNumber = "7094523949"; //8680878612"
      final Uri whatsappUrl = Uri.parse(
        "https://wa.me/$phoneNumber?text=$encodedMessage",
      );

      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Opening WhatsApp...'),
              backgroundColor: Colors.green,
            ),
          );
          _nameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _subjectController.clear();
          _messageController.clear();
        }
      } else {
        throw Exception('Could not launch WhatsApp');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to open WhatsApp: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
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
                            'Contact Us',
                            style: title.copyWith(
                              color: white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Get in Touch with Us',
                            style: subtitle.copyWith(
                              color: white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Contact Information and Form Section
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : screenWidth * 0.1,
                    vertical: 40,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact Information
                      if (!isMobile)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact Information',
                                style: title.copyWith(color: blue),
                              ),
                              sBoxH20,
                              _buildContactInfo(
                                icon: Icons.location_on,
                                title: 'Address',
                                content:
                                    'Thansira Travels\nVillianur, Pondicherry\nPondicherry, India',
                              ),
                              sBoxH20,
                              _buildContactInfo(
                                icon: Icons.phone,
                                title: 'Phone',
                                content: '+91 8680878612',
                                onTap: makeCall,
                              ),
                              sBoxH20,
                              _buildContactInfo(
                                icon: Icons.email,
                                title: 'Email',
                                content: 'info@thansiratravels.com',
                              ),
                              sBoxH20,
                              _buildContactInfo(
                                icon: Icons.message,
                                title: 'WhatsApp',
                                content: '+91 8680878612',
                                onTap: launchWhatsApp,
                              ),
                            ],
                          ),
                        ),
                      if (!isMobile) const SizedBox(width: 40),
                      // Contact Form
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Send us a Message',
                              style: title.copyWith(color: blue),
                            ),
                            sBoxH20,
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  _buildTextField(
                                    controller: _nameController,
                                    label: 'Name',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                  sBoxH20,
                                  _buildTextField(
                                    controller: _emailController,
                                    label: 'Email',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      if (!value.contains('@')) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                  sBoxH20,
                                  _buildTextField(
                                    controller: _phoneController,
                                    label: 'Phone',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your phone number';
                                      }
                                      return null;
                                    },
                                  ),
                                  sBoxH20,
                                  _buildTextField(
                                    controller: _subjectController,
                                    label: 'Subject',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a subject';
                                      }
                                      return null;
                                    },
                                  ),
                                  sBoxH20,
                                  _buildTextField(
                                    controller: _messageController,
                                    label: 'Message',
                                    maxLines: 5,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your message';
                                      }
                                      return null;
                                    },
                                  ),
                                  sBoxH30,
                                  ElevatedButton(
                                    onPressed: _isLoading ? null : _sendMessage,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: blue,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40,
                                        vertical: 15,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child:
                                        _isLoading
                                            ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                      Color
                                                    >(Colors.white),
                                              ),
                                            )
                                            : Text(
                                              'Send Message',
                                              style: subtitle.copyWith(
                                                color: white,
                                                fontSize: 16,
                                              ),
                                            ),
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

                // Mobile Contact Information
                if (isMobile)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Information',
                          style: title.copyWith(color: blue),
                        ),
                        sBoxH20,
                        _buildContactInfo(
                          icon: Icons.location_on,
                          title: 'Address',
                          content:
                              'Thansira Travels\nVillianur, Pondicherry\nPondicherry, India',
                        ),
                        sBoxH20,
                        _buildContactInfo(
                          icon: Icons.phone,
                          title: 'Phone',
                          content: '+91 8680878612',
                          onTap: makeCall,
                        ),
                        sBoxH20,
                        _buildContactInfo(
                          icon: Icons.email,
                          title: 'Email',
                          content: 'info@thansiratravels.com',
                        ),
                        sBoxH20,
                        _buildContactInfo(
                          icon: Icons.message,
                          title: 'WhatsApp',
                          content: '+91 8680878612',
                          onTap: launchWhatsApp,
                        ),
                        sBoxH30,
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
              currentPage: 'Contact Us',
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "whatsapp_contact",
            backgroundColor: Colors.transparent,
            onPressed: launchWhatsApp,
            child: Image.asset("assets/images/whatsapp.png"),
          ),
          const SizedBox(height: 10),
          (isMobile || isTablet)
              ? FloatingActionButton(
                heroTag: "call_contact",
                backgroundColor: Colors.green,
                onPressed: makeCall,
                child: const Icon(Icons.call, color: Colors.white),
              )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildContactInfo({
    required IconData icon,
    required String title,
    required String content,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
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
                Text(
                  content,
                  style: subtitle.copyWith(fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: subtitle.copyWith(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: blue),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
