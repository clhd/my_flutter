import 'dart:math';
double initialX = 1.5;
class Point {
  Point(int i, int j) {
    this.i = i;
    this.j = j;
  }
  late int i, j;

  Point.fromJson(Map<String, int> map);

  get y => null;
  double distanceTo(Point point) {
    return sqrt(i * i + j * j);
  }
//   
//   double? x = initialX;

//   
//   double? a= this.x;

//   
//   late double? z = this.x;

//   Point(this.x, this.y);
// }
}
var p = Point(2, 2);
// assert(p.y == 2) {
//   // TODO: implement assert
//   throw UnimplementedError();
// }

var a = p?.y;
var p1 = Point(2, 2);
var p2 = Point.fromJson({'x': 1, 'y': 2});
double distance = p.distanceTo(Point(4, 4));
var p3 = new Point(2, 2);
var p4 = new Point.fromJson({'x': 1, 'y': 2});
var p5 = const ImmutablePoint(2, 2);

class ImmutablePoint {
  const ImmutablePoint(int i, int j);
}

const pointAndLine = const {
  'point': const [const ImmutablePoint(0, 0)],
  'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
};

void main() {
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);

  assert(identical(a, b));
  var a1 = const ImmutablePoint(1, 1);
  var b1 = ImmutablePoint(1, 1);

  assert(!identical(a1, b1));
  print('The type of a is ${a.runtimeType}'); //获取对象类型
  var point = Point1();
  point.x = 4;
  assert(point.x == 4);
  assert(point.y == null);
}

class Point1 {
  //使用可为 null 类型声明的未初始化实例变量的值为 。 不可为 null 的实例变量必须在声明时初始化。null
  double? x;
  double? y;
  double z = 0;
}
class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';
}
//接口
class Person {
 
  final String _name;

 
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}


class Impostor implements Person {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

// class Point2 implements Comparable, Location {...}

// class Location {
// }
//静态方法
// import 'dart:math';

// class Point {
//   double x, y;
//   Point(this.x, this.y);

//   static double distanceBetween(Point a, Point b) {
//     var dx = a.x - b.x;
//     var dy = a.y - b.y;
//     return sqrt(dx * dx + dy * dy);
//   }
// }

// void main() {
//   var a = Point(2, 2);
//   var b = Point(4, 4);
//   var distance = Point.distanceBetween(a, b);
//   assert(2.8 < distance && distance < 2.9);
//   print(distance);
// }