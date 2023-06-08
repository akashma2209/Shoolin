class VerhoeffAlgorithm {
  static const List<List<int>> _d = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
    [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
    [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
    [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
    [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
    [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
    [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
    [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
    [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  ];

  static const List<List<int>> _p = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
    [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
    [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
    [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
    [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
    [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
    [7, 0, 4, 6, 9, 1, 3, 2, 5, 8]
  ];

  static int _checksum(String number) {
    int c = 0;
    final reversedNumber = number.split('').reversed.join('');
    for (var i = 0; i < reversedNumber.length; i++) {
      c = _d[c][_p[(i + 1) % 8][int.parse(reversedNumber[i])]];
    }
    return c;
  }

  static bool verifyAadhaar(String aadhaarNumber) {
    final cleanNumber = aadhaarNumber.replaceAll(RegExp(r'\D'), ''); // Remove non-digit characters
    final checksumDigit = cleanNumber.substring(cleanNumber.length - 1);
    final numberPart = cleanNumber.substring(0, cleanNumber.length - 1);
    final calculatedChecksum = _checksum(numberPart);
    return calculatedChecksum == int.parse(checksumDigit);
  }
}

void main() {
  // Example usage
  const aadhaarNumber = '4502 9957 1146'; // Replace with the Aadhaar number you want to verify
  final isAadhaarValid = VerhoeffAlgorithm.verifyAadhaar(aadhaarNumber);
  print('$isAadhaarValid');
}
