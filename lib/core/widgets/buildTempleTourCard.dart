import 'package:flutter/material.dart';
import 'package:thansira_travels/core/theme/colors.dart';
import 'package:thansira_travels/core/theme/text_styles.dart';
import 'package:thansira_travels/core/theme/constants.dart';

Widget buildTempleTourCard(Map<String, String> temple) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 4,
    color: appBarColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                temple['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                temple['title']!,
                style: TextStyle(fontWeight: FontWeight.bold, color: white),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
