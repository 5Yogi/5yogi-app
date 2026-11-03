
# 5Yogi - Flutter App - Phương án 3

## Bạn đã có gì:
- Full source code Flutter hoàn chỉnh 4 màn hình: Home, Library, Challenge, Progress
- Đã tích hợp 8 bài tập từ video top $18.22, $7.25 của bạn
- Đã có Youtube Player, Camera, Local Storage (đủ để qua Data Safety)

## Cách build ra file .aab MIỄN PHÍ không cần trả $80 FlutterFlow:

### Cách 1: Build miễn phí bằng Codemagic (khuyên dùng - 5 phút):
1. Tạo tài khoản miễn phí tại codemagic.io (dùng Gmail 5yogi.app@gmail.com)
2. Tạo repo mới trên GitHub, upload toàn bộ thư mục này
3. Trong Codemagic bấm Add Application > chọn repo GitHub > chọn Flutter > Build
4. Codemagic sẽ tự build ra file app-release.aab, bạn tải về
5. File này nộp thẳng lên Play Console > Closed Testing

### Cách 2: Build trên máy tính bằng Android Studio (miễn phí):
1. Cài Android Studio + Flutter SDK
2. Mở thư mục này, chạy lệnh:
   flutter pub get
   flutter build appbundle --release
3. File .aab sẽ nằm ở build/app/outputs/bundle/release/app-release.aab

### Bước tiếp theo để thay video thật:
- Mở file lib/main.dart
- Tìm dòng videoId: "jNQXAC9IVRw" - đây là video mẫu
- Thay bằng ID video YouTube unlisted của bạn: ví dụ https://www.youtube.com/watch?v=ABC123XYZ thì ID là ABC123XYZ
- Build lại là xong

### Để qua luật 12 tester 14 ngày:
- Sau khi có file .aab, vào Play Console > Closed Testing > Upload file > Mời 12 Gmail > Đợi 14 ngày

Bạn cần mình viết sẵn Privacy Policy và Data Safety không? Nói mình làm luôn.
