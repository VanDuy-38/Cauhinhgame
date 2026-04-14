# Dovuidangian - Game do vui

Ung dung Flutter game do vui voi cac man hinh tach file ro rang de de sua va mo rong.

## Tinh nang hien co

- Trang chu bat dau tro choi va mo cau hinh.
- Man hinh chon linh vuc cau do theo danh sach card.
- Man hinh cau hoi do vui voi thanh tien do.
- Man hinh ket qua va cap nhat diem cao nhat.
- Man hinh cau hinh theo mau (am thanh, tu dong luu, volume).

## Cau truc thu muc

```text
lib/
  main.dart
  app.dart
  features/
    quiz/
      data/
        question_bank.dart
        local_quiz_repository.dart
      domain/
        models/
          question.dart
      presentation/
        controllers/
          quiz_controller.dart
        screens/
          home_screen.dart
          quiz_screen.dart
          result_screen.dart
          settings_screen.dart
        widgets/
          answer_option_tile.dart
          progress_header.dart
```

## Chay du an

```bash
flutter pub get
flutter run
```

## Kiem thu nhanh

```bash
flutter analyze
flutter test
```

## Huong mo rong de dang

- Them bo cau hoi moi trong `lib/features/quiz/data/question_bank.dart`.
- Tach them `feature` moi (vd: leaderboard, profile) theo dung mau `data/domain/presentation`.
- Co the thay `LocalQuizRepository` bang API/SQLite ma khong can doi UI.
