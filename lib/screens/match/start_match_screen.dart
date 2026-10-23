import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'add_rounds_screen.dart';
import 'add_groups_screen.dart';

/// Screenshot 1 & 4: "Start a match" with Tournament, Rounds, and Add Groups Modal
class StartMatchScreen extends StatefulWidget {
  final String tournamentName;

  const StartMatchScreen({
    super.key,
    this.tournamentName = 'Hwhah',
  });

  @override
  State<StartMatchScreen> createState() => _StartMatchScreenState();
}

class _StartMatchScreenState extends State<StartMatchScreen> {
  // Options: 'tournament' or 'individual'
  String _selectedMatchType = 'tournament';

  // Selected tournament name
  late String _tournamentName;

  // Selected round (e.g. 'Round Two' or null initially)
  String? _selectedRound;

  @override
  void initState() {
    super.initState();
    _tournamentName = widget.tournamentName;
  }

  void _onAddNewRound() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => AddRoundsScreen(tournamentName: _tournamentName),
      ),
    );

    if (result != null && mounted) {
      setState(() {
        _selectedRound = result;
      });
      // Show the "Add groups" bottom sheet modal matching Screenshot 4
      _showAddGroupsModal(result);
    }
  }

  void _showAddGroupsModal(String round) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // Center drag handle
                Center(
                  child: Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1D5DB),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // Title: "Add groups" in Red font (Screenshot 4)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Add groups',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFE5202C), // Red title matching Screenshot 4
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Description text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'To generate points table, you\'ll need to add groups. Do you want to add groups now?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4B5563),
                      height: 1.35,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Split Bottom Bar: [ Cancel ] | [ Yes, I'm sure ] (Screenshot 4)
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      // Cancel Button (Light grey)
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pop(ctx),
                          child: Container(
                            height: double.infinity,
                            color: const Color(0xFFF1F5F9),
                            child: const Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Yes, I'm sure Button (Solid Teal)
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(ctx); // Close modal
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddGroupsScreen(
                                  selectedRound: round,
                                  tournamentName: _tournamentName,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: double.infinity,
                            color: const Color(0xFF00897B),
                            child: const Center(
                              child: Text(
                                'Yes, I\'m sure',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onNext() {
    if (_selectedMatchType == 'tournament') {
      if (_selectedRound == null) {
        // Prompt user to add a round
        _onAddNewRound();
      } else {
        // Open the Add groups modal or proceed
        _showAddGroupsModal(_selectedRound!);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Individual match scoring mode selected.'),
          backgroundColor: AppColors.primaryTeal,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTournament = _selectedMatchType == 'tournament';

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
          'Start a match',
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
                const SnackBar(
                  content: Text('Help: Select tournament and round to score the match.'),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          children: [
            // Notice text matching Screenshot 1 & 4
            const Text(
              '*Scoring a match on CricHeroes is free.',
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: Color(0xFF4B5563),
              ),
            ),

            const SizedBox(height: 16),

            // Title: Select type of match
            const Text(
              'Select type of match',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 16),

            // Two Cards: Tournament & Individual
            Row(
              children: [
                // Tournament Card
                Expanded(
                  child: _buildMatchCard(
                    type: 'tournament',
                    label: 'Tournament',
                    iconWidget: _buildTrophyIcon(isTournament),
                    isSelected: isTournament,
                  ),
                ),

                const SizedBox(width: 14),

                // Individual Card
                Expanded(
                  child: _buildMatchCard(
                    type: 'individual',
                    label: 'Individual',
                    iconWidget: _buildIndividualIcon(!isTournament),
                    isSelected: !isTournament,
                  ),
                ),
              ],
            ),

            // When Tournament is selected, show:
            // 1. Select tournament
            // 2. Select round (with Add new round button & selected round tile)
            // 3. Info text below
            if (isTournament) ...[
              const SizedBox(height: 24),

              // Title: Select tournament (Screenshot 1)
              const Text(
                'Select tournament',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 12),

              // Tournament Card with teal border & checkmark
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF00897B), width: 1.5),
                ),
                child: Row(
                  children: [
                    // Green circular badge with checkmark
                    Container(
                      width: 38,
                      height: 38,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF00897B), Color(0xFF004D40)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      _tournamentName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Title: Select round (Screenshot 1 & 4)
              const Text(
                'Select round',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 12),

              // Rounds row: Selected Round + Add new round tile
              Row(
                children: [
                  // If a round has been selected, show its tile (Screenshot 4)
                  if (_selectedRound != null) ...[
                    InkWell(
                      onTap: () => _showAddGroupsModal(_selectedRound!),
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        width: 110,
                        height: 95,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5E7EB), // Light grey tile
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xFFD1D5DB)),
                        ),
                        child: Center(
                          child: Text(
                            _selectedRound!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],

                  // "Add new round" dark charcoal tile (Screenshot 1 & 4)
                  InkWell(
                    onTap: _onAddNewRound,
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      width: 110,
                      height: 95,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C2C2C), // Dark charcoal matching Screenshot 1 & 4
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Text(
                          'Add new\nround',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Info note below round selection
              const Text(
                '*You will need to add rounds and groups to generate points table.',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF9CA3AF),
                ),
              ),
            ],

            const SizedBox(height: 24),
          ],
        ),
      ),
      // Persistent Bottom "Next" Button
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
          ),
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: _onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00897B),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMatchCard({
    required String type,
    required String label,
    required Widget iconWidget,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedMatchType = type;
        });
      },
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: 135,
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? const Color(0xFF00897B) : const Color(0xFFE5E7EB),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                color: isSelected ? AppColors.textDark : const Color(0xFF4B5563),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrophyIcon(bool isSelected) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF6FA89E) : Colors.white, // Teal circle when selected
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFF00897B) : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 28,
              )
            : const Icon(
                Icons.emoji_events_outlined,
                color: Color(0xFF374151),
                size: 28,
              ),
      ),
    );
  }

  Widget _buildIndividualIcon(bool isSelected) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF6FA89E) : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFF00897B) : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 28,
              )
            : const Icon(
                Icons.account_circle_outlined,
                color: Color(0xFF374151),
                size: 30,
              ),
      ),
    );
  }
}
