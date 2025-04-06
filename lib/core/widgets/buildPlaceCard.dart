import 'package:flutter/material.dart';
import 'package:thansira_travels/core/theme/colors.dart';
import 'package:thansira_travels/core/theme/text_styles.dart';
import 'package:thansira_travels/core/theme/constants.dart';
// Function to Build Each Place Card

Widget buildPlaceCard(
  context,
  Map<String, String> place, {
  bool isTablet = false,
  bool isMobile = false,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  bool isMobile = screenWidth < 600;
  bool isTablet = screenWidth >= 600 && screenWidth <= 1024;
  bool isDesktop = screenWidth >= 1024;
  double cardWidth =
      isTablet
          ? MediaQuery.of(context).size.width / 2.7
          : isMobile
          ? MediaQuery.of(context).size.width / 1.3
          : MediaQuery.of(context).size.width / 4;
  return Container(
    width: cardWidth,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 5,
          spreadRadius: 2,
        ),
      ],
    ),
    child: Stack(
      children: [
        /// Background Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              place["image"]!,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.5,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print("Error loading image: $error");
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.error, color: Colors.red, size: 50),
                  ),
                );
              },
            ),
          ),
        ),

        /// Dark Overlay for Readability
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
        ),

        /// Place Name & Description
        Positioned(
          bottom: 20,
          left: 15,
          right: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place["title"]!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                place["description"]!,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
