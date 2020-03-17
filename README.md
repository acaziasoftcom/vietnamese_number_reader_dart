# vietnamese_number_reader

Thư viện chuyển đổi số sang chữ tiếng Việt tương ứng dành cho Dart / Flutter.

## Cài đặt:

```yml
dependencies:
  vietnamese_number_reader: ^1.0.0
```

## Sử dụng:

```dart
import 'package:vietnamese_number_reader/vietnamese_number_reader.dart';

...

String result = VietnameseNumberReader.readNumber(12345);
// 'mười hai nghìn ba trăm bốn mươi lăm'
```