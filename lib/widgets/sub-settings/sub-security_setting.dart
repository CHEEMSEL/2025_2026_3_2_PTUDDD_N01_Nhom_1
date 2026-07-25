import 'package:flutter/material.dart';

class SubSecuritySetting extends StatefulWidget {
  const SubSecuritySetting({super.key});

  @override
  State<SubSecuritySetting> createState() => _SubSecuritySettingState();
}

class _SubSecuritySettingState extends State<SubSecuritySetting> {
  bool _biometricEnabled = false;
  bool _appLockEnabled = false;
  int _lockTimeoutMinutes = 1;

  final List<int> _timeoutOptions = [1, 5, 15, 30];

  void _showTimeoutPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Thời gian khóa tự động",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          ..._timeoutOptions.map(
            (minutes) => ListTile(
              title: Text(minutes < 60 ? "$minutes phút" : "${minutes ~/ 60} giờ"),
              trailing: _lockTimeoutMinutes == minutes
                  ? const Icon(Icons.check, color: Colors.blue)
                  : null,
              onTap: () {
                setState(() => _lockTimeoutMinutes = minutes);
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      children: [
        _buildCard(
          children: [
            _buildTile(
              icon: Icons.lock_outline,
              title: "Đổi mật khẩu",
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Tính năng đang phát triển")),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildCard(
          children: [
            _buildTile(
              icon: Icons.fingerprint,
              title: "Vân tay / Face ID",
              trailing: Switch(
                value: _biometricEnabled,
                activeTrackColor: Colors.blue,
                onChanged: (v) => setState(() => _biometricEnabled = v),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildCard(
          children: [
            _buildTile(
              icon: Icons.lock,
              title: "Khóa ứng dụng",
              trailing: Switch(
                value: _appLockEnabled,
                activeTrackColor: Colors.blue,
                onChanged: (v) => setState(() => _appLockEnabled = v),
              ),
            ),
            if (_appLockEnabled)
              _buildTile(
                icon: Icons.timer_outlined,
                title: "Tự động khóa sau",
                subtitle: "$_lockTimeoutMinutes phút",
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                onTap: _showTimeoutPicker,
              ),
          ],
        ),
        const SizedBox(height: 8),
        _buildCard(
          children: [
            _buildTile(
              icon: Icons.info_outline,
              title: "Phiên bản ứng dụng",
              subtitle: "1.0.0",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(children: children),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.withValues(alpha: 0.1),
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(color: Colors.grey)) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}