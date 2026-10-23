import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/user_profile_model.dart';
import '../auth/widgets/auth_common_widgets.dart';
import 'tournament_team_details_screen.dart';

/// Page 15, 16, 17 & Images 1, 2, 3: Add a Tournament / Series Screen
class AddTournamentScreen extends StatefulWidget {
  const AddTournamentScreen({super.key});

  @override
  State<AddTournamentScreen> createState() => _AddTournamentScreenState();
}

class _AddTournamentScreenState extends State<AddTournamentScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _cityController;
  late final TextEditingController _groundController;
  late final TextEditingController _organiserNameController;
  late final TextEditingController _organiserNumberController;
  late final TextEditingController _organiserEmailController;

  String _startDate = 'Start date';
  String _endDate = 'End date';

  String _selectedCategory = 'OPEN';
  String _selectedBallType = 'Tennis'; // Tennis, Leather, Other
  String _selectedPitchType = 'ROUGH';
  String _selectedMatchType = 'Limited Overs';

  bool _needMoreTeams = false;
  bool _needOfficials = false;

  final List<String> _categories = [
    'OPEN',
    'CORPORATE',
    'COMMUNITY',
    'SCHOOL',
    'OTHER',
    'SERIES',
    'COLLEGE',
    'UNIVERSITY',
  ];

  final List<String> _pitchTypes = [
    'ROUGH',
    'CEMENT',
    'TURF',
    'ASTROTURF',
    'MATTING',
  ];

  final List<String> _matchTypes = [
    'Limited Overs',
    'Box/Turf Cricket',
    'Pair Cricket',
    'Test Match',
    'The Hundred',
  ];

  @override
  void initState() {
    super.initState();
    final user = UserProfileModel.instance;
    _nameController = TextEditingController();
    _cityController = TextEditingController(text: user.city);
    _groundController = TextEditingController();
    _organiserNameController = TextEditingController(text: user.name);
    _organiserNumberController = TextEditingController(text: user.mobileNumber);
    _organiserEmailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _groundController.dispose();
    _organiserNameController.dispose();
    _organiserNumberController.dispose();
    _organiserEmailController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final name = _nameController.text.trim().isEmpty ? 'Tournament' : _nameController.text.trim();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TournamentTeamDetailsScreen(tournamentName: name),
      ),
    );
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
          'Add a tournament / series',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 28),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          children: [
            // 1. Add Banner Placeholder (Image 1)
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 72,
                        height: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: const Icon(
                          Icons.image_outlined,
                          size: 36,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                      Positioned(
                        bottom: -2,
                        right: -2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFFD32F2F),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt, size: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Add banner',
                    style: TextStyle(fontSize: 12, color: AppColors.textMedium),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 2. Add Logo Placeholder (Image 1)
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFF9FAFB),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: const Icon(
                          Icons.sports_cricket_outlined,
                          size: 30,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFFD32F2F),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt, size: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Add logo',
                    style: TextStyle(fontSize: 12, color: AppColors.textMedium),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 3. Tournament / series name*
            _buildUnderlineField(
              label: 'Tournament / series name*',
              controller: _nameController,
              hint: '',
              isFocusedStyle: true,
            ),

            const SizedBox(height: 16),

            // 4. City*
            _buildUnderlineField(
              label: 'City*',
              controller: _cityController,
              hint: 'Noida',
            ),

            const SizedBox(height: 16),

            // 5. Ground *
            _buildUnderlineField(
              label: 'Ground *',
              controller: _groundController,
              hint: '',
            ),

            const SizedBox(height: 16),

            // 6. Organiser name*
            _buildUnderlineField(
              label: 'Organiser name*',
              controller: _organiserNameController,
              hint: 'HIMANSHU SINGH',
            ),

            const SizedBox(height: 16),

            // 7. Organiser number*
            _buildUnderlineField(
              label: 'Organiser number*',
              controller: _organiserNumberController,
              hint: '9837100731',
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 16),

            // 8. Organiser email
            _buildUnderlineField(
              label: 'Organiser email',
              controller: _organiserEmailController,
              hint: '',
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                '*Get updated with Sports App offers and help videos on mail.',
                style: TextStyle(fontSize: 12, color: AppColors.textMedium),
              ),
            ),

            const SizedBox(height: 24),

            // 9. Tournament dates
            const Text(
              'Tournament dates',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildDateField(
                    label: _startDate,
                    onTap: () => setState(() => _startDate = '01/11/2026'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDateField(
                    label: _endDate,
                    onTap: () => setState(() => _endDate = '15/11/2026'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // 10. Tournament category* (Image 2)
            Row(
              children: const [
                Text(
                  'Tournament category',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: _categories.map((cat) {
                final isSelected = _selectedCategory == cat;
                return InkWell(
                  onTap: () => setState(() => _selectedCategory = cat),
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
                      cat,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 28),

            // 11. Select ball type* (Image 2)
            Row(
              children: const [
                Text(
                  'Select ball type',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                _buildBallOption(
                  title: 'Tennis',
                  color: const Color(0xFF26A69A),
                  isSelected: _selectedBallType == 'Tennis',
                  showCheckmark: true,
                  onTap: () => setState(() => _selectedBallType = 'Tennis'),
                ),
                const SizedBox(width: 24),
                _buildBallOption(
                  title: 'Leather',
                  color: const Color(0xFFD32F2F),
                  isSelected: _selectedBallType == 'Leather',
                  isLeather: true,
                  onTap: () => setState(() => _selectedBallType = 'Leather'),
                ),
                const SizedBox(width: 24),
                _buildBallOption(
                  title: 'Other',
                  color: const Color(0xFFFFA000),
                  isSelected: _selectedBallType == 'Other',
                  isOther: true,
                  onTap: () => setState(() => _selectedBallType = 'Other'),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // 12. Pitch type (Image 2)
            const Text(
              'Pitch type',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: _pitchTypes.map((pitch) {
                final isSelected = _selectedPitchType == pitch;
                return InkWell(
                  onTap: () => setState(() => _selectedPitchType = pitch),
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
                      pitch,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 28),

            // 13. Match type* (Image 2)
            Row(
              children: const [
                Text(
                  'Match type',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: _matchTypes.map((mt) {
                final isSelected = _selectedMatchType == mt;
                return InkWell(
                  onTap: () => setState(() => _selectedMatchType = mt),
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
                      mt,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // 14. Checkboxes (Image 3)
            CheckboxListTile(
              value: _needMoreTeams,
              onChanged: (val) => setState(() => _needMoreTeams = val ?? false),
              title: const Text(
                'Do you need more teams for your tournament?',
                style: TextStyle(fontSize: 13, color: AppColors.textDark),
              ),
              activeColor: AppColors.primaryTeal,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              value: _needOfficials,
              onChanged: (val) => setState(() => _needOfficials = val ?? false),
              title: const Text(
                'Do you need officials? (e.g. Umpire, Scorer)',
                style: TextStyle(fontSize: 13, color: AppColors.textDark),
              ),
              activeColor: AppColors.primaryTeal,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
            ),

            const SizedBox(height: 36),
          ],
        ),
      ),
      // Persistent Bottom "Next" Button (Image 3)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.divider)),
        ),
        child: SafeArea(
          child: CricHeroesButton(
            text: 'Next',
            onPressed: _onSubmit,
          ),
        ),
      ),
    );
  }

  Widget _buildUnderlineField({
    required String label,
    required TextEditingController controller,
    required String hint,
    bool isFocusedStyle = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: isFocusedStyle ? AppColors.primaryTeal : AppColors.textMedium,
            fontWeight: isFocusedStyle ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textLight, fontWeight: FontWeight.normal),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: isFocusedStyle ? AppColors.primaryTeal : const Color(0xFFD1D5DB),
                width: isFocusedStyle ? 2.0 : 1.0,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryTeal, width: 2.0),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 6),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField({required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFD1D5DB))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: AppColors.textMedium),
            ),
            const Icon(Icons.calendar_month_outlined, size: 20, color: AppColors.textMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildBallOption({
    required String title,
    required Color color,
    required bool isSelected,
    bool showCheckmark = false,
    bool isLeather = false,
    bool isOther = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (showCheckmark)
                  const Icon(Icons.check, color: Colors.white, size: 24),
                if (isLeather)
                  CustomPaint(
                    size: const Size(48, 48),
                    painter: _LeatherBallSeamPainter(),
                  ),
                if (isOther)
                  CustomPaint(
                    size: const Size(48, 48),
                    painter: _DimpleBallPainter(),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

class _LeatherBallSeamPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    path.moveTo(size.width * 0.15, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.42,
      size.width * 0.85,
      size.height * 0.5,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DimpleBallPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        canvas.drawCircle(
          Offset(size.width * 0.28 + i * 5, size.height * 0.28 + j * 5),
          1.2,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
