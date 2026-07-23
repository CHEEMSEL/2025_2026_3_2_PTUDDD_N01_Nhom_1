import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const List<IconData> icons = [
    Icons.person,
    Icons.notifications,
    Icons.security,
    Icons.color_lens,
    Icons.storage,
    Icons.battery_saver,
    Icons.info,
  ];

  static const List<String> titles = [
    "Tài khoản",
    "Thông báo",
    "Bảo mật",
    "Giao diện",
    "Lưu trữ",
    "Tiết kiệm pin",
    "Thông tin ứng dụng",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double boxWidth = constraints.maxWidth > 500
                ? 400
                : constraints.maxWidth * 0.85;

            return SizedBox(
              width: boxWidth,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return SettingItem(
                    icon: icons[index],
                    title: titles[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            iconData: icons[index],
                            title: titles[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Chạm để xem và thay đổi tùy chọn.",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final IconData iconData;
  final String title;

  const SecondScreen({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Icon(
          iconData,
          size: 150,
          color: Colors.blue,
        ),
      ),
    );
  }
}