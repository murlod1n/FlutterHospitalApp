extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
  String mmmmyDateFormat() {
    return substring(0, length-2);
  }

}
