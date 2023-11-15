class HistoryItem {
  final String title;
  final int price;
  final int id;
  String time;
  String date;

  HistoryItem({
    required this.title,
    required this.time,
    required this.date,
    required this.price,
    required this.id,
  });
}
