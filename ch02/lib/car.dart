class Car {
  late int maxSpeed;
  late num price;
  late String name;

  Car(this.maxSpeed, this.price, this.name);
  // Car({required this.maxSpeed, required this.price, required this.name});

  num saleCar() {
    price *= 0.9;

    return price;
  }
}

void main() {
  Car bmw = Car(320, 100000, 'BMW');
  Car benz = Car(250, 70000, 'BENZ');
  Car ford = Car(200, 80000, 'FORD');

  bmw.saleCar();
  benz.saleCar();
  ford.saleCar();

  print(bmw.price);
  print(benz.price);
  print(ford.price);
}
