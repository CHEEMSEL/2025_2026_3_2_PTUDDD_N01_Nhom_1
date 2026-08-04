import 'package:shared_preferences/shared_preferences.dart';
import '../models/account_model.dart';
import '../services/account_xml_codec.dart';

/// Lưu trữ và truy vấn tài khoản.
///
/// Dữ liệu được tuần tự hoá sang XML và lưu vào SharedPreferences
/// (trên desktop/mobile là bộ nhớ của app, trên web là local storage).
class AccountRepository {
  static const String _prefsKey = 'app_accounts_xml';

  /// Đọc toàn bộ tài khoản đã lưu.
  Future<List<AccountModel>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final xml = prefs.getString(_prefsKey);
    if (xml == null || xml.isEmpty) return [];
    return AccountXmlCodec.decode(xml);
  }

  /// Ghi lại toàn bộ danh sách tài khoản dạng XML.
  Future<void> saveAll(List<AccountModel> accounts) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, AccountXmlCodec.encode(accounts));
  }

  /// Kiểm tra tên đăng nhập đã tồn tại chưa.
  Future<bool> isUsernameTaken(String username) async {
    final accounts = await loadAll();
    return accounts.any((a) => a.username == username);
  }

  /// Thêm tài khoản mới. Trả về `true` nếu thành công,
  /// `false` nếu tên đăng nhập đã tồn tại.
  Future<bool> register(AccountModel account) async {
    if (await isUsernameTaken(account.username)) return false;
    final accounts = await loadAll();
    accounts.add(account);
    await saveAll(accounts);
    return true;
  }

  /// Đăng nhập theo tên đăng nhập và mật khẩu.
  /// Trả về tài khoản nếu khớp, ngược lại `null`.
  Future<AccountModel?> login(String username, String password) async {
    final accounts = await loadAll();
    for (final account in accounts) {
      if (account.username == username && account.password == password) {
        return account;
      }
    }
    return null;
  }

  /// Cập nhật thông tin tài khoản theo tên đăng nhập.
  Future<void> updateProfile(AccountModel updated) async {
    final accounts = await loadAll();
    final index = accounts.indexWhere((a) => a.username == updated.username);
    if (index == -1) return;
    accounts[index] = updated;
    await saveAll(accounts);
  }
}
