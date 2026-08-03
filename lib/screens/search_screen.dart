import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';
import 'package:app/data/inbox_data.dart';
import 'package:app/widgets/inbox_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _textController = TextEditingController();
  List<Map<String, String>> _results = inboxData;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    final query = value.trim().toLowerCase();
    setState(() {
      _results = query.isEmpty
          ? inboxData
          : inboxData
              .where((item) =>
                  (item['user'] ?? "").toLowerCase().contains(query) ||
                  (item['message'] ?? "").toLowerCase().contains(query))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textController,
          autofocus: true,
          onChanged: _onChanged,
          decoration: InputDecoration(
            hintText: t('search'),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _results.length,
        itemBuilder: (context, index) => InboxTile(item: _results[index]),
      ),
    );
  }
}