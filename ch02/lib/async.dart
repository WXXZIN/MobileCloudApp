void main() {
  checkVersion();

  print('end process');
}

Future checkVersion() async {
  // Future는 비동기 처리를 위한 클래스
  var version = await lookUpVersion(); // await는 비동기 처리가 완료될 때까지 기다림

  // lookUpVersion() 함수를 호출하여 처리룰 한 후
  // Future 클래스에 저장하고 대기
  // 호출한 main() 함수로 이동하여 나머지 코드 실행
  // 이 함수의 나머지 코드 실행
  print(version);
}

int lookUpVersion() {
  return 12;
}
