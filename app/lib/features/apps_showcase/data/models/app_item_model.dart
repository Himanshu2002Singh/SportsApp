import 'package:flutter/material.dart';

/// Model representing an app product within the CricHeroes suite
class AppItemModel {
  final String id;
  final String name;
  final String tagline;
  final String description;
  final String category;
  final String rating;
  final String downloads;
  final IconData icon;
  final Color primaryColor;
  final List<String> bulletFeatures;
  final String ctaText;
  final String androidUrl;
  final String iosUrl;

  const AppItemModel({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.category,
    required this.rating,
    required this.downloads,
    required this.icon,
    required this.primaryColor,
    required this.bulletFeatures,
    required this.ctaText,
    required this.androidUrl,
    required this.iosUrl,
  });
}
