import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:thansira_travels/core/theme/constants.dart';
import 'package:thansira_travels/core/theme/text_styles.dart';
import 'package:thansira_travels/core/widgets/tour_types_section.dart';
import 'package:thansira_travels/core/widgets/footer_section.dart';
import 'package:url_launcher/url_launcher.dart'
    show LaunchMode, canLaunchUrl, launchUrl;
import 'package:thansira_travels/screens/aboutUs.dart';
import 'package:thansira_travels/screens/contactUs.dart';
import 'package:thansira_travels/screens/studentTour.dart';

import '../core/theme/colors.dart';
import '../core/widgets/buildPlaceCard.dart';
import '../core/widgets/buildTempleTourCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> destinations = [
    {
      "image": "assets/images/collegeTour.jpg",
      "title":
          "Explore, learn, and create memories with our South Indian college and school tour packages!",
    },
    {
      "image": "assets/images/TNtour.jpg",
      "title":
          "Explore the heart of South India with our curated travel packages – where every journey is a story and every destination, a dream!",
    },
    {
      "image": "assets/images/taxi.png",
      "title":
          "Reliable one-way pickup and drop – hassle-free travel, every time!",
    },
  ];
  final List<Map<String, String>> placesToVisit = [
    {
      "image": "assets/images/ooty.jpg",
      "title": "Ooty",
      "description":
          "Ooty's beauty lies in its tranquility, where the hills kiss the sky and nature whispers in your ears.",
    },
    {
      "image": "assets/images/madurai.jpg",
      "title": "Madurai",
      "description":
          "Madurai, where the past meets the present in a symphony of faith, culture, and history.",
    },
    {
      "image": "assets/images/kanyakumari.jpg",
      "title": "Kanniyakumari",
      "description":
          "Kanyakumari, where the sun sets and rises at the edge of the world, merging oceans and dreams.",
    },
    {
      "image": "assets/images/Thanjavur.jpg",
      "title": "Thanjavur",
      "description":
          "Thanjavur, where ancient temples tell tales of devotion, and art flourishes in every corner.",
    },
    {
      "image": "assets/images/Kodaikanal.jpg",
      "title": "Kodaikanal",
      "description":
          "Kodaikanal, where the clouds dance with the mountains, and nature's beauty whispers peace to the soul.",
    },
  ];
  final List<Map<String, String>> templePackages = [
    {
      'image': 'assets/images/temples/temple1.jpg',
      'title': 'Meenakshi Temple, Madurai',
    },
    {
      'image': 'assets/images/temples/temple2.jpg',
      'title': 'Venkateswara Temple, Tirupati',
    },
    {
      'image': 'assets/images/temples/temple3.jpg',
      'title': 'Ayyappa Temple, Sabarimala',
    },
    {
      'image': 'assets/images/temples/temple4.jpg',
      'title': 'Ramanathaswamy Temple, Rameswaram',
    },
    {
      'image': 'assets/images/temples/temple5.jpg',
      'title': 'Airavatesvara Temple, Kumbakonam',
    },
    {
      'image': 'assets/images/temples/temple6.jpg',
      'title': 'Brihadeshwara Temple, Thanjavur',
    },
    {
      'image': 'assets/images/temples/temple7.jpg',
      'title': 'Suchindram Temple, Kanyakumari',
    },
    {
      'image': 'assets/images/temples/temple8.jpg',
      'title': 'Sri Ranganathaswamy Temple, Srirangapatna',
    },
  ];

  late AnimationController _controller;
  late Animation<double> _animation;
  bool isDrawerOpen = false;
  String? hoveredNavItem;
  int currentIndex = 0;

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
    const String phoneNumber = "8680878612"; // Replace with actual number
    final Uri url = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch WhatsApp");
    }
  }

  void makeCall() async {
    const String phoneNumber = "tel:8680878612"; // Replace with actual number
    final Uri url = Uri.parse(phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint("Could not make the call");
    }
  }

  void _handleNavigation(BuildContext context, String route) {
    switch (route) {
      case 'Home':
        // Already on Home page
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth >= 600 && screenWidth <= 1024;
    bool isDesktop = screenWidth >= 1024;

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "THANSIRA\nTRAVELS",
              style: title.copyWith(
                fontFamily: 'poorStory',
                letterSpacing: 2,
                color: HexColor('#E8EEF2'),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:
                      isMobile
                          ? MediaQuery.of(context).size.height / 1.55
                          : isTablet
                          ? MediaQuery.of(context).size.height / 2.5
                          : MediaQuery.of(context).size.height / 1.3,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          if (details.primaryDelta! > 20) {
                            toggleDrawer();
                          } else if (details.primaryDelta! < -20) {
                            toggleDrawer();
                          }
                        },
                        child: InkWell(
                          onTap: () {}, // Empty onTap to make it tappable
                          child: Stack(
                            children: [
                              isMobile
                                  ? Column(
                                    children: [
                                      CarouselSlider(
                                        options: CarouselOptions(
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height /
                                              1.7,
                                          autoPlay: true,
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enlargeCenterPage: false,
                                          enableInfiniteScroll: true,
                                          pageSnapping: true,
                                          viewportFraction: 1,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              currentIndex = index;
                                            });
                                          },
                                        ),
                                        items:
                                            destinations.asMap().entries.map((
                                              entry,
                                            ) {
                                              return buildDestinationCard(
                                                entry.value,
                                                isTablet: isTablet,
                                                isMobile: isMobile,
                                                showReadMore: entry.key == 0,
                                              );
                                            }).toList(),
                                      ),
                                      sBoxH10,
                                      DotsIndicator(
                                        animate: true,
                                        dotsCount: destinations.length,
                                        position: currentIndex.toDouble(),
                                        decorator: DotsDecorator(
                                          color: grey,
                                          activeColor: blue,
                                        ),
                                      ),
                                    ],
                                  )
                                  : Row(
                                    children:
                                        destinations
                                            .asMap()
                                            .entries
                                            .map(
                                              (entry) => Expanded(
                                                child: buildDestinationCard(
                                                  entry.value,
                                                  isTablet: isTablet,
                                                  isMobile: isMobile,
                                                  showReadMore: entry.key == 0,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                (isDesktop || isTablet) ? sBoxH30 : Container(),
                //Title and subtitle
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Thansira ',
                              style: title.apply(color: blue),
                            ),
                            TextSpan(
                              text: 'Travels - Your Trusted Travel Partner',
                              style: title,
                            ),
                          ],
                        ),
                        textAlign:
                            isMobile ? TextAlign.start : TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Thansira Travels provides seamless travel services, including cab bookings, '
                        'tour packages, car rentals, and holiday planning.',
                        textAlign:
                            isMobile ? TextAlign.start : TextAlign.center,
                        style: subtitle,
                      ),
                      Text(
                        'With our expert team, exploring India has never been easier!',
                        textAlign:
                            isMobile ? TextAlign.start : TextAlign.center,
                        style: subtitle,
                      ),
                    ],
                  ),
                ),
                sBoxH50,
                // Place to visit
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Places to visit", style: title.apply(color: blue)),
                      const SizedBox(height: 8),
                      Text(
                        "Discover Tamil Nadu and Pondicherry's unique destinations - from UNESCO World Heritage\n"
                        "Sites to soothing beaches and hill stations.",
                        style: subtitle,
                      ),
                    ],
                  ),
                ),
                sBoxH30,
                // Scrollable Image Cards Section
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 10,
                  ),
                  child: SizedBox(
                    height:
                        isMobile
                            ? MediaQuery.of(context).size.height / 2.5
                            : isTablet
                            ? MediaQuery.of(context).size.height / 3.5
                            : MediaQuery.of(context).size.height / 2,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: double.infinity,
                        viewportFraction:
                            isMobile
                                ? 0.8
                                : isTablet
                                ? 0.4
                                : 0.3,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      itemCount: placesToVisit.length,
                      itemBuilder: (context, index, realIndex) {
                        final place = placesToVisit[index];
                        return buildPlaceCard(
                          context,
                          place,
                          isTablet: isTablet,
                          isMobile: isMobile,
                        );
                      },
                    ),
                  ),
                ),
                sBoxH30,
                //Temple Tour Title
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Temple ',
                                style: title.apply(color: blue),
                              ),
                              TextSpan(text: 'Tours', style: title),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Thansira Travels offers hassle-free temple tour services, including cab bookings, pilgrimage packages, car rentals, and spiritual journey planning.',
                          textAlign: TextAlign.center,
                          style: subtitle,
                        ),
                        Text(
                          'Popular Destinations in Tamil Nadu & Pondicherry',
                          textAlign: TextAlign.center,
                          style: subtitle,
                        ),
                      ],
                    ),
                  ),
                ),
                sBoxH30,
                //Temple Tour Section
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height:
                        isTablet
                            ? ((screenHeight < 800)
                                ? MediaQuery.of(context).size.height
                                : MediaQuery.of(context).size.height / 3)
                            : isMobile
                            ? ((screenHeight < 800)
                                ? MediaQuery.of(context).size.height
                                : MediaQuery.of(context).size.height / 1.25)
                            : MediaQuery.of(context).size.height / 1.2,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = isMobile ? 2 : 4;
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    crossAxisCount, // Adjust for responsiveness
                                mainAxisSpacing: 5,
                              ),
                          itemCount: templePackages.length,
                          itemBuilder: (context, index) {
                            return buildTempleTourCard(templePackages[index]);
                          },
                        );
                      },
                    ),
                  ),
                ),
                sBoxH30,
                //valuable services
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Our Valuable Services",
                        style: title.apply(color: blue),
                      ),
                      Text(
                        "We take care of every detail to ensure you or your clients have an unforgettable holiday experience across Tamil Nadu, Pondicherry and South India.\nOur services include:",
                        style: subtitle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "✅ Customized Holiday Planning – Tailored itineraries based on your time and budget.",
                        style: subtitle,
                      ),
                      Text(
                        "✅ Airport/Railway Station Transfers – Hassle-free pick-up and drop-off.",
                        style: subtitle,
                      ),
                      Text(
                        "✅ Accommodation Arrangements – Hotels, resorts, and houseboats to suit your preferences.",
                        style: subtitle,
                      ),
                      Text(
                        "✅ Cultural Experiences – Traditional performances and sightseeing tours.",
                        style: subtitle,
                      ),
                      Text(
                        "✅ Comfortable Transportation – A wide range of vehicles with professional and courteous drivers.",
                        style: subtitle,
                      ),
                      Text(
                        "✅ Call/Acting Driver Services – Available for flexible travel needs.",
                        style: subtitle,
                      ),
                      Text(
                        "From the moment you arrive until your departure, we ensure a smooth and enjoyable journey.",
                        style: subtitle,
                      ),
                      sBoxH30,
                      const TourTypesSection(),
                    ],
                  ),
                ),
                const FooterSection(),
              ],
            ),
          ),
          if (isMobile) buildAnimatedDrawer(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "whatsapp",
            backgroundColor: Colors.transparent,
            onPressed: launchWhatsApp,
            child: Image.asset("assets/images/whatsapp.png"),
          ),
          SizedBox(height: 10),
          (isMobile || isTablet)
              ? FloatingActionButton(
                heroTag: "call",
                backgroundColor: Colors.green,
                onPressed: makeCall,
                child: const Icon(Icons.call, color: Colors.white),
              )
              : Container(),
        ],
      ),
    );
  }

  // Function to build each destination card
  Widget buildDestinationCard(
    Map<String, String> destination, {
    bool isTablet = false,
    bool isMobile = false,
    bool showReadMore = false,
  }) {
    double cardWidth =
        isTablet
            ? MediaQuery.of(context).size.width / 2
            : isMobile
            ? MediaQuery.of(context).size.width
            : 300;
    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(1.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: white.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        margin: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  destination["image"]!,
                  fit: BoxFit.fill,
                  headers: {
                    'Accept': 'image/jpeg,image/png,image/webp,image/*',
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    print("Error loading image: $error");
                    return Container(
                      color: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, color: Colors.red, size: 50),
                          const SizedBox(height: 10),
                          Text(
                            'Failed to load image',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(
                                () {},
                              ); // Trigger rebuild to retry loading
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [black.withOpacity(0.5), black.withOpacity(0.5)],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination["title"]!,
                    style: subtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  if (showReadMore) ...[
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentTour(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        'Read More',
                        style: subtitle.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Animated Drawer for Mobile
  Widget buildAnimatedDrawer() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return isDrawerOpen
            ? Stack(
              children: [
                GestureDetector(
                  onTap: toggleDrawer,
                  child: Container(
                    color: black.withOpacity(0.5),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Transform.translate(
                    offset: Offset(200 * (1 - _animation.value), 0),
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
              ],
            )
            : const SizedBox.shrink();
      },
    );
  }

  Widget buildDrawerItem(String title, BuildContext context) {
    return GestureDetector(
      onTap: () => _handleNavigation(context, title),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Text(
          title,
          style: subtitle.copyWith(color: white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
