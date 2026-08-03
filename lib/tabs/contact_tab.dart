import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class ContactTab extends StatefulWidget {
  const ContactTab({super.key});

  @override
  State<ContactTab> createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  static const _contacts = [
    {'name': 'An Nguyễn', 'status': 'Online', 'isOnline': true},
    {'name': 'Bình Trần', 'status': 'Truy cập 5 phút trước', 'isOnline': false},
    {'name': 'Cường Lê', 'status': 'Online', 'isOnline': true},
    {'name': 'Dũng Phạm', 'status': 'Truy cập hôm qua', 'isOnline': false},
    {'name': 'Đạt Vũ', 'status': 'Online', 'isOnline': true},
    {'name': 'Hoàng Nam', 'status': 'Busy', 'isOnline': false},
    {'name': 'Quang Anh', 'status': 'Online', 'isOnline': true},
  ];

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
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
              onChanged: (value) {
                setState(() {});
              },
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
          _ActionTile(
            icon: Icons.group_add,
            title: t('create_group'),
            colorSchemeRole: ColorSchemeRole.primaryContainer,
          ),
          _ActionTile(
            icon: Icons.person_add,
            title: t('invite_friends'),
            colorSchemeRole: ColorSchemeRole.tertiaryContainer,
          ),
          const Divider(height: 20, thickness: 1),
          Expanded(
            child: SafeArea(
              top: false,
              minimum: const EdgeInsets.only(bottom: 0),
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) =>
                    _ContactTile(contact: _contacts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ColorSchemeRole { primaryContainer, tertiaryContainer }

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final ColorSchemeRole colorSchemeRole;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.colorSchemeRole,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (bg, fg) = switch (colorSchemeRole) {
      ColorSchemeRole.primaryContainer => (
          scheme.primaryContainer,
          scheme.onPrimaryContainer,
        ),
      ColorSchemeRole.tertiaryContainer => (
          scheme.tertiaryContainer,
          scheme.onTertiaryContainer,
        ),
    };
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: bg,
        child: Icon(icon, color: fg),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      onTap: () {},
    );
  }
}

class _ContactTile extends StatelessWidget {
  final Map<String, dynamic> contact;

  const _ContactTile({required this.contact});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final online = contact['isOnline'] as bool;
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: scheme.secondaryContainer,
            child: Text(
              contact['name'][0],
              style: TextStyle(
                color: scheme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (online)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: scheme.tertiary,
                  shape: BoxShape.circle,
                  border: Border.all(color: scheme.surface, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        contact['name'],
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        contact['status'],
        style: TextStyle(
          color: online ? scheme.tertiary : scheme.outline,
          fontSize: 12,
        ),
      ),
      onTap: () {},
    );
  }
}