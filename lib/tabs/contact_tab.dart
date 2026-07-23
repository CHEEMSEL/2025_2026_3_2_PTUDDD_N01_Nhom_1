import 'package:flutter/material.dart';

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
        title: const Text('Contacts',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_alt_1),
            tooltip: 'Thêm bạn mới',
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
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Tìm kiếm liên hệ...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade900,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.group_add, color: Colors.white),
            ),
            title: const Text('Tạo nhóm mới',
                style: TextStyle(fontWeight: FontWeight.w600)),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person_add, color: Colors.white),
            ),
            title: const Text('Mời bạn bè sử dụng app',
                style: TextStyle(fontWeight: FontWeight.w600)),
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
                        backgroundColor: Colors.blueGrey,
                        child: Text(
                          contact['name'][0],
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.shade300,
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
                          ? Colors.greenAccent
                          : Colors.grey,
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
