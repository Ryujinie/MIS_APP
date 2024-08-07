import 'package:share/share.dart';

String getPrintableData() {
  String data = "";
  // Loop through your data and format it for printing (e.g., add newlines)
  data += "Hello World\n";
  return data;
}

void exportData(String data) async {
  await Share.share(data, subject: "Attendance Record");
}
