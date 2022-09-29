class YearManager {
  static int currentYear = DateTime.now().year;
  static List<int> years() => [for (int i = 2019; i <= currentYear; i++) i];
}
