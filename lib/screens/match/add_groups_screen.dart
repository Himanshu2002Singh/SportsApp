import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Screenshot 5: "Add groups" Screen
class AddGroupsScreen extends StatefulWidget {
  final String selectedRound;
  final String tournamentName;

  const AddGroupsScreen({
    super.key,
    this.selectedRound = 'Round Two',
    this.tournamentName = 'Hwhah',
  });

  @override
  State<AddGroupsScreen> createState() => _AddGroupsScreenState();
}

class _AddGroupsScreenState extends State<AddGroupsScreen> {
  late final TextEditingController _roundController;
  final TextEditingController _groupNameController = TextEditingController();
  final List<String> _selectedTeams = [];

  @override
  void initState() {
    super.initState();
    _roundController = TextEditingController(text: widget.selectedRound);
  }

  @override
  void dispose() {
    _roundController.dispose();
    _groupNameController.dispose();
    super.dispose();
  }

  void _onAddTeamsTap() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        final sampleTeams = ['Rising Star', 'Bulls Warrior', 'Super Strikers', 'Royal XI'];
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Teams for this Group',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                ...sampleTeams.map((team) {
                  final isChecked = _selectedTeams.contains(team);
                  return CheckboxListTile(
                    title: Text(team, style: const TextStyle(fontWeight: FontWeight.w500)),
                    value: isChecked,
                    activeColor: AppColors.primaryTeal,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _selectedTeams.add(team);
                        } else {
                          _selectedTeams.remove(team);
                        }
                      });
                      Navigator.pop(ctx);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  void _saveGroup() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Group saved successfully!'),
        backgroundColor: AppColors.primaryTeal,
      ),
    );
    Navigator.pop(context);
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
          'Add groups',
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
                const SnackBar(content: Text('Help: Add groups and assign teams for points table.')),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [
            // Select round
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select round',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                TextField(
                  controller: _roundController,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryTeal, width: 2),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            // Group name(e. G. Group a or group stage)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Group name(e. G. Group a or group stage)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF00897B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextField(
                  controller: _groupNameController,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00897B), width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00897B), width: 2),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Select teams heading
            const Text(
              'Select teams',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 14),

            // Add teams tile matching Screenshot 5
            Row(
              children: [
                InkWell(
                  onTap: _onAddTeamsTap,
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    width: 110,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Top dark charcoal segment with '+'
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFF263238), // Dark slate/charcoal matching Screenshot 5
                              borderRadius: BorderRadius.vertical(top: Radius.circular(3)),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        // Bottom light grey segment with "Add teams"
                        Container(
                          width: double.infinity,
                          height: 38,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(3)),
                          ),
                          child: const Center(
                            child: Text(
                              'Add teams',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF374151),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_selectedTeams.isNotEmpty) ...[
                  const SizedBox(width: 12),
                  ..._selectedTeams.map((team) {
                    return Container(
                      width: 100,
                      height: 130,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.primaryTeal),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xFFE0F2F1),
                            child: Icon(Icons.sports_cricket, color: AppColors.primaryTeal),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            team,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ],
            ),

            const SizedBox(height: 48),

            // Save group button
            SizedBox(
              height: 46,
              child: ElevatedButton(
                onPressed: _saveGroup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryTeal,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: const Text(
                  'Save Group',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
