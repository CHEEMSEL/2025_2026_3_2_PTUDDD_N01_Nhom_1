import '../models/account_model.dart';

/// Mã hoá / giải mã danh sách tài khoản sang dạng XML.
///
/// Cấu trúc:
/// ```xml
/// <accounts>
///   <account>
///     <username>...</username>
///     <password>...</password>
///     <fullName>...</fullName>
///     <email>...</email>
///     <phone>...</phone>
///     <birthday>...</birthday>
///     <gender>...</gender>
///   </account>
/// </accounts>
/// ```
abstract final class AccountXmlCodec {
  static const String _rootTag = 'accounts';
  static const String _itemTag = 'account';
  static const List<String> _fields = [
    'username',
    'password',
    'fullName',
    'email',
    'phone',
    'birthday',
    'gender',
  ];

  /// Tuần tự hoá danh sách tài khoản thành chuỗi XML.
  static String encode(List<AccountModel> accounts) {
    final buffer = StringBuffer();
    buffer.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    buffer.writeln('<$_rootTag>');
    for (final account in accounts) {
      buffer.writeln('  <$_itemTag>');
      buffer.writeln('    <username>${_escape(account.username)}</username>');
      buffer.writeln('    <password>${_escape(account.password)}</password>');
      buffer.writeln('    <fullName>${_escape(account.fullName)}</fullName>');
      buffer.writeln('    <email>${_escape(account.email)}</email>');
      buffer.writeln('    <phone>${_escape(account.phone)}</phone>');
      buffer.writeln('    <birthday>${_escape(account.birthday)}</birthday>');
      buffer.writeln('    <gender>${_escape(account.gender)}</gender>');
      buffer.writeln('  </$_itemTag>');
    }
    buffer.write('</$_rootTag>');
    return buffer.toString();
  }

  /// Phân tích chuỗi XML thành danh sách tài khoản.
  static List<AccountModel> decode(String xml) {
    final accounts = <AccountModel>[];
    final itemPattern = RegExp(
      '<$_itemTag>(.*?)</$_itemTag>',
      dotAll: true,
    );
    for (final match in itemPattern.allMatches(xml)) {
      final body = match.group(1) ?? '';
      final values = <String, String>{};
      for (final field in _fields) {
        values[field] = _extractTag(body, field);
      }
      accounts.add(
        AccountModel(
          username: values['username'] ?? '',
          password: values['password'] ?? '',
          fullName: values['fullName'] ?? '',
          email: values['email'] ?? '',
          phone: values['phone'] ?? '',
          birthday: values['birthday'] ?? '',
          gender: values['gender'] ?? '',
        ),
      );
    }
    return accounts;
  }

  static String _extractTag(String body, String tag) {
    final pattern = RegExp('<$tag>(.*?)</$tag>', dotAll: true);
    final match = pattern.firstMatch(body);
    return match == null ? '' : _unescape(match.group(1) ?? '');
  }

  static String _escape(String value) {
    return value
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&apos;');
  }

  static String _unescape(String value) {
    return value
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&apos;', "'")
        .replaceAll('&amp;', '&');
  }
}
