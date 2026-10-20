import 'package:flutter/material.dart';

/// Model representing a CricHeroes core feature highlight
class FeatureHighlight {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final String badgeText;
  final Color accentColor;

  const FeatureHighlight({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.badgeText,
    required this.accentColor,
  });
}
