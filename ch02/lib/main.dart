void main() {
  print('Hello, World!');

  var name = 'choi';
  /* name = 1; // var로 선언된 변수는 자료형 변경 불가능 */

  var dart; // dart는 dynamic 타입 변수 자료형 변경 가능
  dart = 'hello';
  dart = 1234;
  // dart = true;

  if (dart is String) {
    print(dart.length);
  }

  if (dart is int) {
    if (dart.isEven) {
      print('짝수');
    }
  }

  // null safety는 개발자가 null 값을 참조할 수 없도록 하는 것
  // 개발자가 null 값을 참조하면 런타임 에라가 발생

  String nickname = 'choi';
  /* nickname = null; // 오류 발생 */

  // 상황에 따라 null 값이 필요한 경우
  // 자료형 뒤에 ?를 붙여 null 값을 허용

  String? nickname2 = 'choi';
  nickname2 = null; // 오류 발생하지 않음

  final nickname3 = 'choi'; // final은 변수에 값을 한 번만 할당할 수 있음
  /* nickname3 = 'kim'; // 오류 발생 */

  // API 값을 가져와서 변수에 할당하는 경우
  // 변수를 만들고 이후에 값을 할당하는 경우
  late final api;

  // late로 선언된 변수는 나중에 값을 할당할 수 있음
  // 단, 나중에 값을 할당하지 않으면 런타임 에러 발생
  /* print(api) */

  api = 123;
  print(api);

  // const는 컴파일 시점에 값을 할당해야 함
  const api2 = 123;
  /* const api3; // 오류 발생 */

  // num은 정수와 실수를 포함하는 자료형
  // num은 int와 double의 부모 클래스
  int age = 23;
  num x = 12;
  x = 3.14;

  // 변수에 변수를 할당하는 경우
  var name2 = 'choi';
  var age2 = 25;
  var gretting = '안녕하세요. 저는 $name2입니다. 저는 2026년 월드컵 때는 ${age2 + 2}살 입니다.';

  print(gretting);

  // List
  var five = true;
  var number1 = [1, 2, 3, 4];
  List<int> number2 = [1, 2, 3, 4, if (five) 5]; // Collection if

  // number1에 숫자 5를 추가
  if (five) {
    number1.add(5);
  }

  print(number1);
  print(number2);

  // Collection for
  var youngBoy = ['임상우', '문교원', '유태웅'];
  var players = ['이대호', '정근우', '박용택', for (var player in youngBoy) '*$player'];

  print(players);

  // Map : key-value 형태로 데이터를 저장
  var student = {'name': 'choi', 'age': 25, 'grade': 4};

  Map<String, Object> student2 = {
    'name': 'choi',
    'age': 25,
    'grade': 3,
  };

  print(student);
  print(student2);

  // Set : 중복을 허용하지 않는 컬렉션
  var number3 = {1, 2, 3, 4};
  number3.add(1);
  number3.add(1);
  number3.add(1);

  print(number3);
}
