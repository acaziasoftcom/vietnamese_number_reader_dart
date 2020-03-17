import 'package:test/test.dart';

import 'package:vietnamese_number_reader/vietnamese_number_reader.dart';

void main() {
  test('translate number correctly', () {
    String result = VietnameseNumberReader.readNumber(12345);
    expect(result, 'mười hai nghìn ba trăm bốn mươi lăm');
  });
}
