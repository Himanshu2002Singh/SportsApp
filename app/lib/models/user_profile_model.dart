import 'package:flutter/foundation.dart';

/// User profile state shared across onboarding, profile, and tournament creation
class UserProfileModel extends ChangeNotifier {
  String name;
  String mobileNumber;
  String city;
  String gender;
  String? profileImagePath;
  String dob;
  String email;
  String playingRole;
  String battingStyle;
  String bowlingStyle;

  UserProfileModel({
    this.name = 'HIMANSHU SINGH',
    this.mobileNumber = '9837100731',
    this.city = 'Noida',
    this.gender = 'Male',
    this.profileImagePath,
    this.dob = '2002-08-08',
    this.email = '',
    this.playingRole = 'None',
    this.battingStyle = 'Right-hand bat',
    this.bowlingStyle = 'None',
  });

  // Singleton instance for easy frontend access
  static final UserProfileModel instance = UserProfileModel();

  void updateProfile({
    String? name,
    String? mobileNumber,
    String? city,
    String? gender,
    String? profileImagePath,
    String? dob,
    String? email,
    String? playingRole,
    String? battingStyle,
    String? bowlingStyle,
  }) {
    if (name != null) this.name = name;
    if (mobileNumber != null) this.mobileNumber = mobileNumber;
    if (city != null) this.city = city;
    if (gender != null) this.gender = gender;
    if (profileImagePath != null) this.profileImagePath = profileImagePath;
    if (dob != null) this.dob = dob;
    if (email != null) this.email = email;
    if (playingRole != null) this.playingRole = playingRole;
    if (battingStyle != null) this.battingStyle = battingStyle;
    if (bowlingStyle != null) this.bowlingStyle = bowlingStyle;
    notifyListeners();
  }
}
