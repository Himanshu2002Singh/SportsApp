import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/user_profile_model.dart';
import '../../../widgets/cricket_art_widgets.dart';
import '../auth/widgets/auth_common_widgets.dart';

/// Page 21: Edit Profile Screen
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _locationController;
  late final TextEditingController _dobController;
  late final TextEditingController _emailController;
  late final TextEditingController _mobileController;

  String _playingRole = 'None';
  String _battingStyle = 'Right-hand bat';
  String _bowlingStyle = 'None';
  String _gender = 'Male';

  final List<String> _playingRoles = [
    'None',
    'Top-order batter',
    'Middle-order batter',
    'Wicketkeeper batter',
    'All-rounder',
    'Bowler',
  ];

  final List<String> _battingStyles = [
    'Right-hand bat',
    'Left-hand bat',
  ];

  final List<String> _bowlingStyles = [
    'None',
    'Right-arm fast',
    'Right-arm medium',
    'Right-arm off-spin',
    'Right-arm leg-spin',
    'Left-arm fast',
    'Left-arm orthodox',
  ];

  @override
  void initState() {
    super.initState();
    final user = UserProfileModel.instance;
    _nameController = TextEditingController(text: user.name);
    _locationController = TextEditingController(text: user.city);
    _dobController = TextEditingController(text: user.dob);
    _emailController = TextEditingController(text: user.email);
    _mobileController = TextEditingController(text: user.mobileNumber);
    _playingRole = user.playingRole;
    _battingStyle = user.battingStyle.isEmpty ? 'Right-hand bat' : user.battingStyle;
    _bowlingStyle = user.bowlingStyle;
    _gender = user.gender;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  void _onUpdate() {
    UserProfileModel.instance.updateProfile(
      name: _nameController.text.trim(),
      city: _locationController.text.trim(),
      dob: _dobController.text.trim(),
      email: _emailController.text.trim(),
      mobileNumber: _mobileController.text.trim(),
      playingRole: _playingRole,
      battingStyle: _battingStyle,
      bowlingStyle: _bowlingStyle,
      gender: _gender,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully!'),
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
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        children: [
          // Change Photo Section (Page 21)
          Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CricketerAvatarWidget(size: 92),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: AppColors.brandRed,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Change photo',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.brandRed,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Player name
          _buildUnderlineInput(label: 'Player name', controller: _nameController),
          const SizedBox(height: 16),

          // Location*
          _buildUnderlineInput(label: 'Location*', controller: _locationController),
          const SizedBox(height: 16),

          // Date of birth
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Date of birth',
                style: TextStyle(fontSize: 12, color: AppColors.textMedium),
              ),
              TextField(
                controller: _dobController,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark),
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.inputBorder),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryTeal),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel, size: 18, color: AppColors.textLight),
                    onPressed: () => _dobController.clear(),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Email address
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildUnderlineInput(
                  label: 'Email address',
                  controller: _emailController,
                  hint: 'Enter your email',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primaryTeal),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Mobile number
          _buildUnderlineInput(
            label: 'Mobile number',
            controller: _mobileController,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),

          // Playing role Dropdown
          _buildDropdownField(
            label: 'Playing role',
            value: _playingRole,
            items: _playingRoles,
            onChanged: (val) => setState(() => _playingRole = val ?? _playingRole),
          ),
          const SizedBox(height: 20),

          // Batting style Dropdown
          _buildDropdownField(
            label: 'Batting style',
            value: _battingStyle,
            items: _battingStyles,
            onChanged: (val) => setState(() => _battingStyle = val ?? _battingStyle),
          ),
          const SizedBox(height: 20),

          // Bowling style Dropdown
          _buildDropdownField(
            label: 'Bowling style',
            value: _bowlingStyle,
            items: _bowlingStyles,
            onChanged: (val) => setState(() => _bowlingStyle = val ?? _bowlingStyle),
          ),
          const SizedBox(height: 24),

          // Gender Radio Options
          Row(
            children: [
              _buildGenderRadio('Male'),
              const SizedBox(width: 8),
              _buildGenderRadio('Female'),
              const SizedBox(width: 8),
              _buildGenderRadio('Prefer not to say'),
            ],
          ),

          const SizedBox(height: 36),

          // Update Button
          CricHeroesButton(
            text: 'Update',
            onPressed: _onUpdate,
          ),

          const SizedBox(height: 36),
        ],
      ),
    );
  }

  Widget _buildUnderlineInput({
    required String label,
    required TextEditingController controller,
    String? hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.textMedium),
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textLight, fontWeight: FontWeight.normal),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.inputBorder),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryTeal),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.textMedium),
        ),
        DropdownButtonFormField<String>(
          initialValue: items.contains(value) ? value : items.first,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.textDark),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.inputBorder),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryTeal),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: AppColors.textLight),
        ),
      ],
    );
  }

  Widget _buildGenderRadio(String label) {
    final isSelected = _gender == label;
    return InkWell(
      onTap: () => setState(() => _gender = label),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
            size: 20,
            color: isSelected ? AppColors.primaryTeal : AppColors.textLight,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
