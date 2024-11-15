# xsis

Xsis test.

## Flutter Version:
```
3.24.4
```

## Run Project :runner:
### Android:
```
Production
flutter run --flavor prod --debug lib/main.dart
flutter run --flavor prod --release lib/main.dart

Development
flutter run --flavor dev --debug lib/main_dev.dart
flutter run --flavor dev --release lib/main_dev.dart
```

### iOS:
```
Production
flutter run --flavor prod --debug lib/main.dart
flutter run --flavor prod --release lib/main.dart

Development
flutter run --flavor dev --debug lib/main_dev.dart
flutter run --flavor dev --release lib/main_dev.dart
```

## Build Project :hammer:

### Android
```
Production
flutter build apk --flavor prod lib/main.dart --debug
flutter build apk --flavor prod lib/main.dart --release

flutter build appbundle --flavor prod lib/main.dart --debug
flutter build appbundle --flavor prod lib/main.dart --release

Development
flutter build apk --flavor dev lib/main_dev.dart --debug
flutter build apk --flavor dev lib/main_dev.dart --release

flutter build appbundle --flavor dev lib/main_dev.dart --debug
flutter build appbundle --flavor dev lib/main_dev.dart --release
```
##### iOS
```
Production
flutter build ios --flavor prod lib/main.dart --release

Development
flutter build ios --flavor dev lib/main_dev.dart --release
```
