import 'dart:math' as math;

void main() {
  var rand = math.Random();
  Set<int> lottoNumber = Set();

  while (lottoNumber.length < 6) {
    lottoNumber.add(rand.nextInt(45));
  }

  print(lottoNumber);
}
