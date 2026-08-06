# TeleLite — Ứng dụng trò chuyện trực tuyến

**2025_2026_3_2_PTUDDD_N01_Nhom_1**

Ứng dụng trò chuyện trực tuyến **TeleLite** phát triển trên nền tảng **Flutter & Dart** theo chuẩn Material 3 — sản phẩm bài tập lớn Nhóm 1, học phần *Phát triển ứng dụng di động*.

## Tính năng chính

- Đăng nhập / tạo tài khoản, lưu tài khoản dạng XML (`shared_preferences`)
- Hộp thư (Inbox), phòng chat 2 chiều mô phỏng real-time (`Stream`)
- Danh sách liên hệ, tab thông báo + màn hình chi tiết
- Hồ sơ người dùng và cài đặt (theme sáng/tối, 6 màu nhấn chat, ngôn ngữ, bảo mật, lưu trữ, pin, about)
- Đa ngôn ngữ (i18n) 5 thứ tiếng: Tiếng Việt, English, 日本語, 한국어, 中文
- Chạy đa nền tảng: Android, Web, Linux

## Công nghệ sử dụng

- **Flutter / Dart** (Material 3, Dynamic Color)
- **flutter_bloc** — `AuthCubit`, `ChatCubit`
- **provider** — `LanguageProvider`, `ThemeProvider`
- **shared_preferences** — lưu cấu hình và tài khoản (XML)

## Các bước setup khi fork/clone về

### 1. Chuẩn bị môi trường

- Cài đặt **Flutter SDK** (Dart `^3.5.0`) theo hướng dẫn chính thức: https://docs.flutter.dev/get-started/install
- Cài **Git** và cấu hình `user.name` / `user.email`.
- Kiểm tra cài đặt thành công:

```bash
flutter --version
flutter doctor
```

> Khi chạy trên Linux cần bật Linux desktop; khi chạy Web bật Web:
> ```bash
> flutter config --enable-linux-desktop
> flutter config --enable-web
> ```

### 2. Clone / Fork dự án

```bash
git clone https://github.com/CHEEMSEL/2025_2026_3_2_PTUDDD_N01_Nhom_1.git
cd 2025_2026_3_2_PTUDDD_N01_Nhom_1
```

### 3. Cài đặt dependencies

```bash
flutter pub get
```

### 4. Chạy ứng dụng

Chạy trên thiết bị Android (cần kết nối adb):

```bash
flutter run
# hoặc chỉ định thiết bị:
flutter run -d <device-id>   # xem danh sách thiết bị bằng: flutter devices
```

Chạy trên Linux desktop:

```bash
flutter run -d linux
```

Chạy trên Web:

```bash
flutter run -d web-server
```

### 5. Build APK (Android)

```bash
flutter build apk --debug
# APK nằm tại: build/app/outputs/flutter-apk/app-debug.apk
```

Cài APK vào máy qua adb:

```bash
adb install -r build/app/outputs/flutter-apk/app-debug.apk
```

### 6. (Tùy chọn) Sinh lại app icon

```bash
dart run flutter_launcher_icons
```

## Thành viên nhóm

| Tài khoản Git | Tên | MSSV |
|---------------|-----|------|
| `CHEEMSEL` | Nguyễn Đăng Quang Anh | 24100455 |
| `mine1x` | Cao Bá Sơn | 24100038 |
| `TrungToKim` | Tô Kim Trung | 24100131 |

- Giảng viên hướng dẫn: Nguyễn Xuân Quế
- Lớp tín chỉ: CSE702115-2-3-25(N01)
