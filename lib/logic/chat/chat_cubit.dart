import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/message_model.dart';
import '../../data/repositories/chat_repository.dart';
import 'chat_state.dart';

/// Logic xử lý gửi/nhận tin nhắn real-time của phòng chat.
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._repository) : super(const ChatState()) {
    _subscription = _repository.messageStream.listen(_onIncomingMessage);
  }

  final ChatRepository _repository;
  late final StreamSubscription<MessageModel> _subscription;

  /// Tải danh sách các phòng chat.
  Future<void> loadRooms() async {
    emit(state.copyWith(status: ChatStatus.loading));
    try {
      final rooms = await _repository.getChatRooms();
      emit(state.copyWith(status: ChatStatus.loaded, rooms: rooms));
    } catch (e) {
      emit(state.copyWith(status: ChatStatus.error, errorMessage: '$e'));
    }
  }

  /// Tải lịch sử tin nhắn của một phòng chat.
  Future<void> loadMessages(String roomId) async {
    emit(state.copyWith(status: ChatStatus.loading));
    try {
      final messages = await _repository.getMessages(roomId);
      emit(state.copyWith(status: ChatStatus.loaded, messages: messages));
    } catch (e) {
      emit(state.copyWith(status: ChatStatus.error, errorMessage: '$e'));
    }
  }

  /// Gửi tin nhắn đi thông qua socket.
  Future<void> sendMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    await _repository.sendMessage(trimmed);
  }

  /// Khi có tin nhắn mới từ socket, cập nhật vào danh sách tin nhắn.
  void _onIncomingMessage(MessageModel message) {
    emit(
      state.copyWith(
        status: ChatStatus.loaded,
        messages: [...state.messages, message],
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _repository.dispose();
    return super.close();
  }
}