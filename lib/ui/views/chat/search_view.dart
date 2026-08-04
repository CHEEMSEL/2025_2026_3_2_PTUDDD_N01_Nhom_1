import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/chat_room_model.dart';
import '../../../logic/chat/chat_cubit.dart';
import '../../../logic/chat/chat_state.dart';
import '../../../shared/localization/language_dict.dart';
import '../../widgets/chat/inbox_tile.dart';

/// Màn hình tìm kiếm phòng chat / tin nhắn.
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().loadRooms();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  List<ChatRoomModel> _filterRooms(List<ChatRoomModel> rooms, String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return rooms;
    return rooms
        .where((room) =>
            room.name.toLowerCase().contains(q) ||
            room.lastMessage.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textController,
          autofocus: true,
          onChanged: (_) => setState(() {}),
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
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          final results = _filterRooms(state.rooms, _textController.text);
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) => InboxTile(room: results[index]),
          );
        },
      ),
    );
  }
}