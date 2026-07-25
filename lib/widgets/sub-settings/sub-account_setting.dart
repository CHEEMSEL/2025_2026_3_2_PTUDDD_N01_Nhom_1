import 'package:flutter/material.dart';

class SubAccountSetting extends StatelessWidget {
  const SubAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        SizedBox(height: 16),
        Text(
          "Nguyễn Văn A",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          "nguyenvana@email.com",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Số điện thoại"),
                trailing: Text("0123 456 789"),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Ngày sinh"),
                trailing: Text("01/01/2000"),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.wc),
                title: Text("Giới tính"),
                trailing: Text("Nam"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
