@echo off
echo Building APK DEV
flutter build apk --release --no-tree-shake-icons --dart-define=ENVIRONMENT=DEV