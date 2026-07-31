import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class ContactTab extends StatefulWidget {
  const ContactTab({super.key});

  @override
  State<ContactTab> createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  final List<Map<String, dynamic>> contacts = const [
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.tr(context, 'contacts')),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_alt_1),
            tooltip: AppTranslations.tr(context, 'add_friend'),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: AppTranslations.tr(context, 'search_contact'),
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
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(Icons.group_add,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            title: Text(AppTranslations.tr(context, 'create_group'),
                style: const TextStyle(fontWeight: FontWeight.w600)),
            onTap: () {},
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child: Icon(Icons.person_add,
                  color: Theme.of(context).colorScheme.onTertiaryContainer),
            ),
            title: Text(AppTranslations.tr(context, 'invite_friends'),
                style: const TextStyle(fontWeight: FontWeight.w600)),
            onTap: () {},
          ),
          const Divider(height: 20, thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        child: Text(
                          contact['name'][0],
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (contact['isOnline'])
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.surface,
                                width: 2,
                              ),
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
                      color: contact['isOnline']
                          ? Theme.of(context).colorScheme.tertiary
                          : Theme.of(context).colorScheme.outline,
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
