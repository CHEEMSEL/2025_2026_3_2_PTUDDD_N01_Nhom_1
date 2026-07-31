import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/langs/language_controller.dart';
import 'package:app/langs/language_dict.dart';

class SubThemeSetting extends StatefulWidget {
  const SubThemeSetting({super.key});

  @override
  State<SubThemeSetting> createState() => _SubThemeSettingState();
}

class _SubThemeSettingState extends State<SubThemeSetting> {
  String selectedTheme = 'light';
  Color chatAccentColor = Colors.blue;

  final List<Color> themeColors = [
    Colors.blue,
    Colors.purple,
    Colors.teal,
    Colors.orange,
    Colors.pink,
    Colors.green,
  ];

  final List<Map<String, String>> supportedLanguages = [
    {'code': 'vi', 'name': 'Tiếng Việt', 'flag': '🇻🇳'},
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸'},
    {'code': 'ja', 'name': '日本語', 'flag': '🇯🇵'},
    {'code': 'ko', 'name': '한국어', 'flag': '🇰🇷'},
    {'code': 'zh', 'name': '中文', 'flag': '🇨🇳'},
  ];

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);
    final langCode = langProvider.currentLangCode;

    final currentLangMap = supportedLanguages.firstWhere(
      (element) => element['code'] == langCode,
      orElse: () => supportedLanguages.first,
    );

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          headerTheme(AppTranslations.getText('screen_mode', langCode)),
          const SizedBox(height: 8),
          Row(
            children: [
              buildThemeCard(
                title: AppTranslations.getText('light', langCode),
                icon: Icons.light_mode_outlined,
                value: 'light',
                isDarkPreview: false,
              ),
              const SizedBox(width: 12),
              buildThemeCard(
                title: AppTranslations.getText('dark', langCode),
                icon: Icons.dark_mode_outlined,
                value: 'dark',
                isDarkPreview: true,
              ),
              const SizedBox(width: 12),
              buildThemeCard(
                title: AppTranslations.getText('system', langCode),
                icon: Icons.settings_brightness_outlined,
                value: 'system',
                isSystemPreview: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          headerTheme(AppTranslations.getText('chat_color', langCode)),
          const SizedBox(height: 8),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey.shade900
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: chatAccentColor,
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 1.5,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                          child: Text(
                            AppTranslations.getText('chat_preview', langCode),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: themeColors.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final color = themeColors[index];
                        final isSelected = chatAccentColor == color;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              chatAccentColor = color;
                            });
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: color,
                            child: isSelected
                                ? const Icon(Icons.check,
                                    color: Colors.white, size: 18)
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          headerTheme(AppTranslations.getText('language', langCode)),
          const SizedBox(height: 8),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(AppTranslations.getText('language', langCode)),
              subtitle: Text(
                currentLangMap['name']!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showLanguageBottomSheet(context),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            final langProvider = Provider.of<LanguageProvider>(context);
            final currentLang = langProvider.currentLangCode;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppTranslations.getText('choose_language', currentLang),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: supportedLanguages.length,
                      itemBuilder: (context, index) {
                        final lang = supportedLanguages[index];
                        final isSelected = currentLang == lang['code'];

                        return ListTile(
                          leading: Text(
                            lang['flag']!,
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(lang['name']!),
                          trailing: isSelected
                              ? const Icon(Icons.check_circle,
                                  color: Colors.blue)
                              : null,
                          onTap: () {
                            langProvider.changeLanguage(lang['code']!);
                            setModalState(() {});
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildThemeCard({
    required String title,
    required IconData icon,
    required String value,
    bool isDarkPreview = false,
    bool isSystemPreview = false,
  }) {
    final bool isSelected = selectedTheme == value;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTheme = value;
          });
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outlineVariant,
              width: isSelected ? 2 : 1,
            ),
            color: isDarkPreview
                ? Colors.black87
                : (isSystemPreview
                    ? Colors.grey.shade800
                    : Colors.grey.shade200),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isDarkPreview || isSystemPreview
                    ? Colors.white
                    : Colors.black87,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: isDarkPreview || isSystemPreview
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
              if (isSelected) ...[
                const SizedBox(height: 4),
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                  size: 16,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget headerTheme(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }
}
