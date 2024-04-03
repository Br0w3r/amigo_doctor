@echo off
echo Building APK PROD
flutter build apk --release --no-tree-shake-icons --dart-define=ENVIRONMENT=PROD