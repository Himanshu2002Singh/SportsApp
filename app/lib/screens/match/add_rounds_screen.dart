import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Screenshots 2 & 3: "Add rounds" Screen with expandable accordions
class AddRoundsScreen extends StatefulWidget {
  final String tournamentName;

  const AddRoundsScreen({
    super.key,
    this.tournamentName = 'Hwhah',
  });

  @override
  State<AddRoundsScreen> createState() => _AddRoundsScreenState();
}

class _AddRoundsScreenState extends State<AddRoundsScreen> {
  // Whether each accordion section is expanded
  bool _isRoundRobinExpanded = true;
  bool _isKnockoutExpanded = true;

  final List<String> _roundRobinRounds = [
    'League Matches',
    'Pre Quarter Final',
    'Quarter Final',
    'Semi Final',
    'Semi Final 1',
    'Semi Final 2',
    'Final',
    'Super League',
    'Super Eight',
    'Super Ten',
    'Super Six',
    'Super Four',
  ];

  final List<String> _knockoutRounds = [
    'Super Knockout',
    'Round One',
    'Round Two',
    'Round Three',
    'Round Four',
    'Round Five',
    'Pre Quarter Final',
    'Quarter Final',
    'Semi Final',
    'Semi Final 1',
    'Semi Final 2',
    'Final',
  ];

  void _selectRound(String roundName) {
    // Return the selected round to the previous screen
    Navigator.pop(context, roundName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.headerRed,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add rounds',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white, size: 22),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Help: Select tournament round type.')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 26),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Playing round setup tutorial...')),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Accordion 1: Round robin (league matches) - Screenshot 2
          _buildAccordionHeader(
            title: 'Round robin (league matches)',
            isExpanded: _isRoundRobinExpanded,
            onTap: () {
              setState(() {
                _isRoundRobinExpanded = !_isRoundRobinExpanded;
              });
            },
          ),
          if (_isRoundRobinExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: Column(
                children: _roundRobinRounds.map((round) => _buildRoundItem(round)).toList(),
              ),
            ),

          // Accordion 2: Knock out - Screenshot 3
          _buildAccordionHeader(
            title: 'Knock out',
            isExpanded: _isKnockoutExpanded,
            onTap: () {
              setState(() {
                _isKnockoutExpanded = !_isKnockoutExpanded;
              });
            },
          ),
          if (_isKnockoutExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: Column(
                children: _knockoutRounds.map((round) => _buildRoundItem(round)).toList(),
              ),
            ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildAccordionHeader({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        color: AppColors.charcoalHeader, // Dark charcoal header matching Screenshot 2 & 3
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundItem(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
        trailing: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.grey300, width: 1.5),
          ),
          child: const Icon(
            Icons.check,
            size: 13,
            color: AppColors.grey400,
          ),
        ),
        onTap: () => _selectRound(title),
      ),
    );
  }
}
