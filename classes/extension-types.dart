extension type IdNumber(int id) {
  // Wraps the 'int' type's '<' operator:
  operator <(IdNumber other) => id < other.id;
}

void main() {
  int myUnsafeId = 42424242;
  myUnsafeId = myUnsafeId + 10;

  var safeId = IdNumber(42424242);
  // safeId + 10;
  // myUnsafeId = safeId;
  myUnsafeId = safeId as int;
  safeId < IdNumber(42424241);
  E(4);
  E.n(3);
  E.m(5, "Hello!");
  var n = NumberE(1);

  if (n is int) print(n.value); // Prints 1.

  if (n case int x) print(x.toRadixString(10)); // Prints 1.
  switch (n) {
    case int(:var isEven):
      print("$n (${isEven ? "even" : "odd"})"); // Prints 1 (odd).
  }
  int i = 2;
  if (i is NumberE) print("It is"); // Prints 'It is'.
  if (i case NumberE v) print("value: ${v.value}"); // Prints 'value: 2'.
  switch (i) {
    case NumberE(:var value):
      print("value: $value"); // Prints 'value: 2'.
  }
}

extension type E(int i) {
  E.n(this.i);
  E.m(int j, String foo) : i = j + foo.length;
}
extension type E1<T>(List<T> elements) {
  // ...
}
extension type const E2._(int it) {
  E2() : this._(42);
  E2.otherName(this.it);
}

void main2() {
  E2();
  const E2._(2);
  E2.otherName(3);
}

extension type E3._(int i) {
  E3.fromString(String foo) : i = int.parse(foo);
}
extension type NumberE(int value) {
  // Operator:
  NumberE operator +(NumberE other) => NumberE(value + other.value);
  // Getter:
  NumberE get myNum => this;
  // Method:
  bool isValid() => !value.isNegative;
}
// 其表示类型。 这使得表示类型的所有成员都隐式可用 更改为扩展类型。

extension type NumberI(int i) implements int {}

// 其表示类型的超类型。 这使得超类型的成员可用， 虽然不一定是表示类型的所有成员。

extension type Sequence<T>(List<T> _) implements Iterable<T> {}

extension type Id(int _id) implements Object {
  static Id? tryParse(String source) => int.tryParse(source) as Id?;
}
// 对同一表示类型有效的另一种扩展类型。 这允许您跨多个扩展类型重用操作 （类似于多重继承）。

extension type const Opt<T>._(({T value})? _) {
  const factory Opt(T value) = Val<T>;
  const factory Opt.none() = Non<T>;
}
extension type const Val<T>._(({T value}) _) implements Opt<T> {
  const Val(T value) : this._((value: value));
  T get value => _.value;
}
extension type const Non<T>._(Null _) implements Opt<Never> {
  const Non() : this._(null);
}
extension type MyString(String _) implements String {
  // @redeclare
  int operator [](int index) => codeUnitAt(index);
}
extension type NumberE1(int value) {
  NumberE operator +(NumberE other) => NumberE(value + other.value);

  NumberE get next => NumberE(value + 1);
  bool isValid() => !value.isNegative;

  void isNegative() {}
}

void testE() {
  var num = NumberE1(1);
}

extension type NumberT(int value) implements int {
  // Doesn't explicitly declare any members of 'int'.
  NumberT get i => this;
}

void main1() {
 
  var v1 = NumberT(1); 
  int v2 = NumberT(2); 
  var v3 = v1.i - v1; 
  var v4 = v2 + v1; 
  var v5 = 2 + v1; 

  // v2.i;
}

void testE1() {
//   var num1 = NumberE1(1);
//   int num2 = NumberE1(2);

//   num1.isValid();
//   num1.isNegative();
//   var sum1 = num1 + num1;
//   var diff1 = num1 - num1;
//   var diff2 = num1.value - 2;
//   var sum2 = num1 + 2;

//   List<NumberE> numbers = [
//     NumberE(1),
//     num1.next,
//     1,
//   ];
// }
}
