import "package:flutter/material.dart";
import 'package:app/tabs/inbox_tab.dart';
import 'package:app/tabs/contact_tab.dart';
import 'package:app/tabs/notification_tab.dart';
import 'package:app/tabs/setting_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int slectedIndex = 0;
  //Các tabs
  final List<Widget> _tabs = [
    Center(child: InboxTab()),
    const Center(child: ContactTab()),
    const Center(child: NotificationTab()),
    const Center(child: SettingTab())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
      ),
      body: IndexedStack(
        index: slectedIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        //Chọn kiểu điều hướng (fixed: hiển thị tất cả các tab, shifting: chỉ hiển thị tab được chọn).
        //Nếu để shift thì phải đặt màu riêng cho từng item (custom later)
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[800],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        // Hàm chọn tab
        currentIndex: slectedIndex,
        onTap: (index) {
          setState(() {
            slectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
