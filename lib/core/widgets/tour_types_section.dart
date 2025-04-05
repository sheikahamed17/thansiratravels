import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../../screens/studentTour.dart';

class TourTypesSection extends StatelessWidget {
  const TourTypesSection({super.key});

  final List<Map<String, String>> tourTypes = const [
    {
      'image': 'assets/images/studentTour.webp',
      'title': 'Student Tours',
      'description':
          'Vacation in India in itself is a great experience, and when it is accompanied by some theme, We offer you an enthusiastic, excitement filled trip for students & youths to know the beauty of our country.',
    },
    {
      'image': 'assets/images/honeymoon.webp',
      'title': 'Honeymoon Tours',
      'description':
          'Are you delighted for your honeymoon vacation? This is one such escape you will treasure for the rest of your life. It is a once in a lifetime opportunity to have fun and give a good start to your love and romantic life.',
    },
    {
      'image': 'assets/images/navatirupathi.webp',
      'title': 'Navatirupati Tours',
      'description':
          'Nava Tirupathi is a set of 9 temples of Lord Vishnu located between Tirunelveli and Tiruchendur in the southern Indian state of Tamilnadu. Nava Tirupathi is part of the 108 Divya Desam temples revered',
    },
    {
      'image': 'assets/images/grouptour.webp',
      'title': 'Group Tours',
      'description':
          'Considered among the most popular types of travel, group tours have gained a lot of famee. If you have been meaning to go on a group trip with your friends but hate to be the one to make all the plans, a well-priced',
    },
  ];

  void _handleTourTap(BuildContext context, String title) {
    if (title == 'Student Tours') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StudentTour()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Our Tour Packages', style: title.apply(color: blue)),
        const SizedBox(height: 20),
        if (isMobile)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tourTypes.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _buildMobileTourCard(
                    context,
                    tourTypes[index],
                    index == 0,
                  ),
                ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tourTypes.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _buildTourCard(
                    context,
                    tourTypes[index],
                    isTablet: isTablet,
                    showReadMore: index == 0,
                  ),
                ),
          ),
      ],
    );
  }

  Widget _buildMobileTourCard(
    BuildContext context,
    Map<String, String> tour,
    bool showReadMore,
  ) {
    return GestureDetector(
      onTap: () => _handleTourTap(context, tour['title']!),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                tour['image']!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tour['title']!,
                    style: subtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tour['description']!,
                    style: subtitle.copyWith(fontSize: 16, color: black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (showReadMore) ...[
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed:
                            () => _handleTourTap(context, tour['title']!),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          backgroundColor: blue.withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Read More',
                          style: subtitle.copyWith(
                            color: blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

  Widget _buildTourCard(
    BuildContext context,
    Map<String, String> tour, {
    bool isTablet = false,
    bool showReadMore = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = isTablet ? 180.0 : 200.0;

    return GestureDetector(
      onTap: () => _handleTourTap(context, tour['title']!),
      child: Container(
        width: screenWidth,
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
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Image.asset(
                  tour['image']!,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tour['title']!,
                        style: subtitle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        tour['description']!,
                        style: subtitle.copyWith(fontSize: 16, color: black),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (showReadMore) ...[
                        const Spacer(),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed:
                                () => _handleTourTap(context, tour['title']!),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              backgroundColor: blue.withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Read More',
                              style: subtitle.copyWith(
                                color: blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
