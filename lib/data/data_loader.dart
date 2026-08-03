import 'dart:isolate';
import 'package:app/data/inbox_data.dart';

Future<List<Map<String, String>>> loadInbox() async {
  final items = await Isolate.run(
    () => List<Map<String, String>>.of(inboxData),
  );
  await Future<void>.delayed(const Duration(milliseconds: 150));
  return items;
}