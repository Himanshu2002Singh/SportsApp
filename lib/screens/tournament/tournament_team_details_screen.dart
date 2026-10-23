import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'tournament_dashboard_screen.dart';

/// Screenshot 1: Team details (Step 2 of Add Tournament)
class TournamentTeamDetailsScreen extends StatefulWidget {
  final String tournamentName;

  const TournamentTeamDetailsScreen({
    super.key,
    this.tournamentName = 'Tournament',
  });

  @override
  State<TournamentTeamDetailsScreen> createState() => _TournamentTeamDetailsScreenState();
}

class _TournamentTeamDetailsScreenState extends State<TournamentTeamDetailsScreen> {
  final TextEditingController _locationController = TextEditingController(text: 'Noida');
  final TextEditingController _entryFeeController = TextEditingController();
  final TextEditingController _totalTeamsController = TextEditingController();
  final TextEditingController _teamsRequiredController = TextEditingController();
  final TextEditingController _additionalDetailsController = TextEditingController();

  String _winningPrize = 'TROPHIES'; // CASH, TROPHIES, BOTH
  String _matchesOn = 'WEEKENDS'; // WEEKENDS, WEEKDAYS, ALL DAYS
  String _matchTiming = 'DAY'; // DAY, NIGHT, DAY & NIGHT
  String _tournamentFormat = 'LEAGUE'; // LEAGUE, KNOCKOUT

  @override
  void dispose() {
    _locationController.dispose();
    _entryFeeController.dispose();
    _totalTeamsController.dispose();
    _teamsRequiredController.dispose();
    _additionalDetailsController.dispose();
    super.dispose();
  }

  void _onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TournamentDashboardScreen(
          tournamentName: widget.tournamentName,
          autoShowTeamsModal: true,
        ),
      ),
    );
  }

  void _onSkip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TournamentDashboardScreen(
          tournamentName: widget.tournamentName,
          autoShowTeamsModal: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          children: [
            // Heading matching Screenshot 1
            const Text(
              'Team details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Because you need teams for your tournament',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF6B7280),
              ),
            ),

            const SizedBox(height: 24),

            // Tournament location*
            _buildUnderlineInput(
              label: 'Tournament location*',
              controller: _locationController,
            ),

            const SizedBox(height: 18),

            // Entry fee* and Total no. of teams* side by side
            Row(
              children: [
                Expanded(
                  child: _buildUnderlineInput(
                    label: 'Entry fee*',
                    controller: _entryFeeController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: _buildUnderlineInput(
                    label: 'Total no. of teams*',
                    controller: _totalTeamsController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // How many teams do you require?
            _buildUnderlineInput(
              label: 'How many teams do you require?',
              controller: _teamsRequiredController,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 26),

            // Winning prize*
            _buildSectionTitle('Winning prize*'),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildChip('CASH', _winningPrize == 'CASH', () => setState(() => _winningPrize = 'CASH')),
                const SizedBox(width: 8),
                _buildChip('TROPHIES', _winningPrize == 'TROPHIES', () => setState(() => _winningPrize = 'TROPHIES')),
                const SizedBox(width: 8),
                _buildChip('BOTH', _winningPrize == 'BOTH', () => setState(() => _winningPrize = 'BOTH')),
              ],
            ),

            const SizedBox(height: 24),

            // Matches on*
            _buildSectionTitle('Matches on*'),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildChip('WEEKENDS', _matchesOn == 'WEEKENDS', () => setState(() => _matchesOn = 'WEEKENDS')),
                const SizedBox(width: 8),
                _buildChip('WEEKDAYS', _matchesOn == 'WEEKDAYS', () => setState(() => _matchesOn = 'WEEKDAYS')),
                const SizedBox(width: 8),
                _buildChip('ALL DAYS', _matchesOn == 'ALL DAYS', () => setState(() => _matchesOn = 'ALL DAYS')),
              ],
            ),

            const SizedBox(height: 24),

            // Match timing*
            _buildSectionTitle('Match timing*'),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildChip('DAY', _matchTiming == 'DAY', () => setState(() => _matchTiming = 'DAY')),
                const SizedBox(width: 8),
                _buildChip('NIGHT', _matchTiming == 'NIGHT', () => setState(() => _matchTiming = 'NIGHT')),
                const SizedBox(width: 8),
                _buildChip('DAY & NIGHT', _matchTiming == 'DAY & NIGHT', () => setState(() => _matchTiming = 'DAY & NIGHT')),
              ],
            ),

            const SizedBox(height: 24),

            // Tournament format*
            _buildSectionTitle('Tournament format*'),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildChip('LEAGUE', _tournamentFormat == 'LEAGUE', () => setState(() => _tournamentFormat = 'LEAGUE')),
                const SizedBox(width: 8),
                _buildChip('KNOCKOUT', _tournamentFormat == 'KNOCKOUT', () => setState(() => _tournamentFormat = 'KNOCKOUT')),
              ],
            ),

            const SizedBox(height: 26),

            // Any additional details?
            _buildSectionTitle('Any additional details?'),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD1D5DB)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: _additionalDetailsController,
                maxLines: 4,
                style: const TextStyle(fontSize: 14, color: AppColors.textDark),
                decoration: const InputDecoration(
                  hintText: 'Add more details like prizes, trophies, entry fees, rules, etc.',
                  hintStyle: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
                  contentPadding: EdgeInsets.all(12),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              '*We will use this information to post a looking request on CricHeroes.',
              style: TextStyle(fontSize: 11, color: Color(0xFF6B7280), fontStyle: FontStyle.italic),
            ),

            const SizedBox(height: 36),
          ],
        ),
      ),
      // Persistent Bottom Split Bar: Skip (Grey) | Continue (Teal) (Screenshot 1)
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 52,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: _onSkip,
                  child: Container(
                    height: double.infinity,
                    color: const Color(0xFFF1F5F9), // Light grey
                    child: const Center(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: _onContinue,
                  child: Container(
                    height: double.infinity,
                    color: const Color(0xFF00897B), // Teal
                    child: const Center(
                      child: Text(
                        'Continue',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE2E8F0) : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF94A3B8) : const Color(0xFFE2E8F0),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
      ),
    );
  }

  Widget _buildUnderlineInput({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF9CA3AF),
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 6),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD1D5DB)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryTeal, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
