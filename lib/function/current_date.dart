import 'package:intl/intl.dart';

String getCurDate() {
  var now = DateTime.now();
  var formatter = DateFormat('dd-MM-yyyy');
  return formatter.format(now);
}
