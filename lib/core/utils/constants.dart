class AppConstants {
  // Database
  static const String dbName = 'luckyhub.db';
  static const int dbVersion = 3; // Updated để thêm item_label vào results

  // Default values
  static const String defaultThemeColor = '#6366F1';
  static const int defaultWeight = 1;
  static const int minItemsRequired = 1;

  // Animation
  static const int minSpinDuration = 2000; 
  static const int maxSpinDuration = 8000; 
  static const int defaultSpinDuration = 3000; 
  static const int minFullTurns = 3;
  static const int maxFullTurns = 6;

  // UI
  static const double defaultWheelSize = 320.0;
  static const double wheelPointerSize = 24.0;
}
