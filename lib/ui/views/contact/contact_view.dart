import 'package:flutter/material.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/chat_repository.dart';
import '../../../shared/localization/language_dict.dart';
import '../../widgets/contact/contact_tile.dart';

/// Màn hình danh sách liên hệ.
class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    final repository = ChatRepository();
    return FutureBuilder<List<UserModel>>(
      future: repository.getContacts(),
      builder: (context, snapshot) {
        final contacts = snapshot.data ?? const <UserModel>[];
        return Scaffold(
          appBar: AppBar(
            title: Text(t('contacts')),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add_alt_1),
                tooltip: t('add_friend'),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: t('search_contact'),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              ContactActionTile(
                icon: Icons.group_add,
                title: t('create_group'),
              ),
              ContactActionTile(
                icon: Icons.person_add,
                title: t('invite_friends'),
                isTertiary: true,
              ),
              const Divider(height: 20, thickness: 1),
              Expanded(
                child: SafeArea(
                  top: false,
                  minimum: const EdgeInsets.only(bottom: 0),
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) =>
                        ContactTile(contact: contacts[index]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}