bool isNoble(int atomicNumber) {
  var _nobleGases;
  return _nobleGases[atomicNumber] != null;
}

isNoble1(atomicNumber) {
  var _nobleGases;
  return _nobleGases[atomicNumber] != null;
}

// bool isNoble2(int atomicNumber) => _nobleGases[atomicNumber] != null;
/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool? bold, bool? hidden}) {}

/// Sets the [bold] and [hidden] flags ...
void enableFlags1({bool bold = false, bool hidden = false}) {}
void foo() {}
// repeat(times: 2, () {
//   ...
// });
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

void main() {
  enableFlags(bold: true, hidden: false);

  enableFlags1(bold: true);
  assert(say('Bob', 'Howdy') == 'Bob says Howdy');
  assert(say('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal');
  String say1(String from, String msg, [String device = 'carrier pigeon']) {
    var result = '$from says $msg with a $device';
    return result;
  }

  assert(say1('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }

  var add2 = makeAdder(2);

  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
  Function x;

  x = foo;
  assert(foo == x);

  x = A.bar;
  assert(A.bar == x);

  var v = A();
  var w = A();
  var y = w;
  x = w.baz;

  assert(y.baz == x);

  assert(v.baz != w.baz);
  foo1() {}

  assert(foo1() == null);
  // (String, int) foo1() {
  //   return ('something', 42);
  // }
}

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}

external void someFunc(int i);
void printElement(int element) {
  print(element);
}

var list = [1, 2, 3];
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

// Pass printElement as a parameter.
// list.forEach(printElement);
var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
// assert(loudify('hello') == '!!! HELLO !!!');
const list1 = ['apples', 'bananas', 'oranges'];
// list.map((item) {
//   return item.toUpperCase();
// }).forEach((item) {
//   print('$item: ${item.length}');
// });

class A {
  static void bar() {}
  void baz() {}
}
