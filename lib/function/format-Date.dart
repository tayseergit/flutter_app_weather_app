DateTime formatDate(int date) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
  return dateTime;
}
