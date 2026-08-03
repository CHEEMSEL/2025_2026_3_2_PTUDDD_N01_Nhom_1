import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';
import 'package:app/data/inbox_data.dart';
import 'package:app/widgets/inbox_tile.dart';
import 'package:app/screens/search_screen.dart';

class InboxTab extends StatelessWidget {
  const InboxTab({super.key});

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return Scaffold(
      appBar: AppBar(
        title: Text(t('inbox')),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchScreen()),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.view_headline_rounded), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: 0),
        child: ListView.builder(
          itemCount: inboxData.length,
          itemBuilder: (context, index) => InboxTile(item: inboxData[index]),
        ),
      ),
    );
  }
}
