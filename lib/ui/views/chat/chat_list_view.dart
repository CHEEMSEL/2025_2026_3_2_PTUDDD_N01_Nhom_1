import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/chat/chat_cubit.dart';
import '../../../logic/chat/chat_state.dart';
import '../../../shared/localization/language_dict.dart';
import '../../widgets/chat/inbox_tile.dart';
import '../../widgets/home/dock_metrics.dart';
import '../../widgets/home/floating_dock.dart';
import 'search_view.dart';

/// Tab danh sách các phòng chat (hộp thư).
class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().loadRooms();
  }

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
              MaterialPageRoute(builder: (_) => const SearchView()),
            ),
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned.fill(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  switch (state.status) {
                    case ChatStatus.loading:
                      return const Center(child: CircularProgressIndicator());
                    case ChatStatus.error:
                      return Center(child: Text(state.errorMessage ?? ''));
                    case ChatStatus.initial:
                    case ChatStatus.loaded:
                      return ListView.builder(
                        padding: const EdgeInsets.only(
                            bottom: kDockScrollPadding),
                        itemCount: state.rooms.length,
                        itemBuilder: (context, index) => _AnimatedItem(
                          room: state.rooms[index],
                          index: index,
                        ),
                      );
                  }
                },
              ),
            ),
            Positioned(
              right: 16,
              bottom: DockMetrics.of(context) + 2 * kDockBottomInset,
              child: FloatingActionButton(
                onPressed: () {},
                tooltip: t('create_account'),
                shape: const CircleBorder(),
                child: const Icon(Icons.edit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bọc hiệu ứng xuất hiện tuần tự cho từng mục chat.
class _AnimatedItem extends StatefulWidget {
  final dynamic room;
  final int index;

  const _AnimatedItem({required this.room, required this.index});

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
        child: InboxTile(room: widget.room),
      ),
    );
  }
}
