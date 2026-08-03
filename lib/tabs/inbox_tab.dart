import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';
import 'package:app/data/data_loader.dart';
import 'package:app/widgets/inbox_tile.dart';
import 'package:app/screens/search_screen.dart';

class InboxTab extends StatefulWidget {
  const InboxTab({super.key});

  @override
  State<InboxTab> createState() => _InboxTabState();
}

class _InboxTabState extends State<InboxTab> {
  late final Future<List<Map<String, String>>> _inboxFuture = loadInbox();

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
              icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: 0),
        child: FutureBuilder<List<Map<String, String>>>(
          future: _inboxFuture,
          builder: (context, snapshot) {
            final items = snapshot.data;
            if (items == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  _AnimatedItem(item: items[index], index: index),
            );
          },
        ),
      ),
    );
  }
}

class _AnimatedItem extends StatefulWidget {
  final Map<String, String> item;
  final int index;

  const _AnimatedItem({required this.item, required this.index});

  @override
  State<_AnimatedItem> createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<_AnimatedItem>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );
  late final Animation<double> _fade =
      CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  late final Animation<Offset> _slide =
      Tween(begin: const Offset(0, 0.12), end: Offset.zero).animate(_fade);

  @override
  void initState() {
    super.initState();
    _timer = Timer(
      Duration(milliseconds: 250 + widget.index * 35),
      () {
        if (mounted) _controller.forward();
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: InboxTile(item: widget.item),
      ),
    );
  }
}
