library vietnamese_number_reader;

/// Read number into word phrase.
class VietnameseNumberReader {
  int addOne(int value) => value + 1;

  static List<int> _separateNumber(int inputNumber) {
    List<int> bufferList = [];
    while (inputNumber > 0) {
      bufferList.add(inputNumber % 10);
      inputNumber = (inputNumber / 10).floor();
    }

    return bufferList;
  }

  static List<String> _numberToString(List<int> list) {
    List<String> nList = list.map((item) => item.toString()).toList();
    print(list[0].runtimeType);

    for (var i = 0; i < list.length; i++) {
      if (list[i] == 1 && (i % 3 == 0) && list[i] > 1) {
        //  && list[i + 1] > 1
        nList[i] = 'mốt';
      } else if (list[i] == 1) {
        nList[i] = 'một';
      } else if (list[i] == 2) {
        nList[i] = 'hai';
      } else if (list[i] == 3) {
        nList[i] = 'ba';
      } else if (list[i] == 4 && i % 3 != 0) {
        nList[i] = 'bốn';
      } else if (list[i] == 4 && i % 3 == 0) {
        nList[i] = 'tư';
      } else if (list[i] == 5 && i % 3 != 0) {
        nList[i] = 'năm';
      } else if (list[i] == 5 && i % 3 == 0) {
        nList[i] = 'lăm';
      } else if (list[i] == 6) {
        nList[i] = 'sáu';
      } else if (list[i] == 7) {
        nList[i] = 'bảy';
      } else if (list[i] == 8) {
        nList[i] = 'tám';
      } else if (list[i] == 9) {
        nList[i] = 'chín';
      } else {
        nList[i] = 'không';
      }
    }

    return nList;
  }

  static List<String> _readPrefix(List<dynamic> list) {
    for (var i = 0; i < list.length; i++) {
      if (i % 3 == 0 && list[i] != 'không') {
        list[i] += '';
      } else if (i % 3 == 0 && list[i] == 'không') {
        list[i] = '';
      } else if (i % 3 == 1 && list[i] == 'không' && list[i - 1] != '') {
        list[i] = 'lẻ';
      } else if (i % 3 == 1 && list[i - 1] == 'không' && list[i - 1] == '') {
        list[i] = '';
      } else if (i % 3 == 1 && list[i] == 'một') {
        list[i] = ' mười'; // Cái này là mười (<19)
      } else if (i % 3 == 1 && list[i] != 'mốt') {
        list[i] += ' mươi'; // Cái này là mươi (>19)
      } else {
        list[i] += ' trăm';
      }
    }

    List<String> nList = list.map((item) => item.toString()).toList();
    return nList;
  }

  // Đọc hậu tố:
  static List<String> readSuffix(List<dynamic> list) {
    int len = list.length;
    if (len <= 3) {
      list[0] += '';
    } else if (len > 3 && len <= 6) {
      list[0] += '';
      list[3] += ' nghìn';
    } else if (len > 6 && len <= 9) {
      list[0] += '';
      list[3] += ' nghìn';
      list[6] += ' triệu';
    } else {
      list[0] += '';
      list[3] += ' nghìn';
      list[6] += ' triệu';
      list[9] += ' tỉ';
    }

    List<String> nList = list.map((item) => item.toString()).toList();
    return nList;
  }

  static String readNumber(int inputNumber) {
    List<int> newArray = _separateNumber(inputNumber);
    List<String> stringifiedNumber = _numberToString(newArray);

    var pArray = _readPrefix(stringifiedNumber);
    var sArray = readSuffix(pArray);
    var srArray = sArray.reversed.toList();

    var result = '';

    for (var i = 0; i < srArray.length; i++) {
      result += srArray[i] + ' ';
    }

    return result.trim();
  }
}
