import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/logic/settings/language_provider.dart';
import 'package:app/logic/settings/theme_provider.dart';
import 'package:app/shared/constants/app_colors.dart';
import 'package:app/shared/localization/language_dict.dart';

class SubThemeSetting extends StatefulWidget {
  const SubThemeSetting({super.key});

  @override
  State<SubThemeSetting> createState() => _SubThemeSettingState();
}

class _SubThemeSettingState extends State<SubThemeSetting> {
  Color _accentColor = AppColors.seed;

  static const _languages = [
    {'code': 'vi', 'name': 'Tiếng Việt', 'flag': '🇻🇳'},
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸'},
    {'code': 'ja', 'name': '日本語', 'flag': '🇯🇵'},
    {'code': 'ko', 'name': '한국어', 'flag': '🇰🇷'},
    {'code': 'zh', 'name': '中文', 'flag': '🇨🇳'},
  ];

  @override
  Widget build(BuildContext context) {
    final langCode = Provider.of<LanguageProvider>(context).currentLangCode;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final selectedMode = switch (themeProvider.themeMode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    String t(String key) => AppTranslations.getText(key, langCode);
    final currentLang = _languages.firstWhere(
      (e) => e['code'] == langCode,
      orElse: () => _languages.first,
    );

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _SectionTitle(t('screen_mode')),
          const SizedBox(height: 8),
          Row(
            children: [
              _ThemeCard(
                title: t('light'),
                icon: Icons.light_mode_outlined,
                selected: selectedMode == 'light',
                onTap: () =>
                    themeProvider.setThemeMode(ThemeMode.light),
              ),
              const SizedBox(height: 12),
              _ThemeCard(
                title: t('dark'),
                icon: Icons.dark_mode_outlined,
                selected: selectedMode == 'dark',
                dark: true,
                onTap: () =>
                    themeProvider.setThemeMode(ThemeMode.dark),
              ),
              const SizedBox(height: 12),
              _ThemeCard(
                title: t('system'),
                icon: Icons.settings_brightness_outlined,
                selected: selectedMode == 'system',
                dark: true,
                onTap: () =>
                    themeProvider.setThemeMode(ThemeMode.system),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _SectionTitle(t('chat_color')),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context).colorScheme.inverseSurface
                          : Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: _accentColor,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
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
                            t('chat_preview'),
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
                      itemCount: AppColors.chatAccents.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final color = AppColors.chatAccents[index];
                        return GestureDetector(
                          onTap: () => setState(() => _accentColor = color),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: color,
                            child: _accentColor == color
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
          _SectionTitle(t('language')),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(t('language')),
              subtitle: Text(
                currentLang['name']!,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showLanguageSheet(context),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final langProvider = Provider.of<LanguageProvider>(context);
            final currentLang = langProvider.currentLangCode;
            String t(String key) => AppTranslations.getText(key, currentLang);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(t('choose_language'),
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _languages.length,
                      itemBuilder: (context, index) {
                        final lang = _languages[index];
                        final isSelected = currentLang == lang['code'];
                        return ListTile(
                          leading: Text(lang['flag']!,
                              style: const TextStyle(fontSize: 24)),
                          title: Text(lang['name']!),
                          trailing: isSelected
                              ? Icon(Icons.check_circle,
                                  color:
                                      Theme.of(context).colorScheme.primary)
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
}

class _ThemeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final bool dark;
  final VoidCallback onTap;

  const _ThemeCard({
    required this.title,
    required this.icon,
    required this.selected,
    this.dark = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? scheme.primary : scheme.outlineVariant,
              width: selected ? 2 : 1,
            ),
            color: dark ? scheme.inverseSurface : scheme.surfaceContainerHighest,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  color: dark ? scheme.onInverseSurface : scheme.onSurface),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: dark ? scheme.onInverseSurface : scheme.onSurface,
                ),
              ),
              if (selected) ...[
                const SizedBox(height: 4),
                Icon(Icons.check_circle, color: scheme.primary, size: 16),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}