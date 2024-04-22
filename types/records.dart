void main(){
   // print('The last character: ${hi.characters.last}');
  var record = ('first', a: 2, b: true, 'last');

  print(record.$1); // Prints 'first'
  print(record.a); // Prints 2
  print(record.b); // Prints true
  print(record.$2); // Prints 'last'
  (num, Object) pair = (42, 'a');

var first = pair.$1; // Static type `num`, runtime type `int`.
var second = pair.$2; // Static type `Object`, runtime type `String`.
(int x, int y, int z) point = (1, 2, 3);
(int r, int g, int b) color = (1, 2, 3);

print(point == color); // Prints 'true'.
({int x, int y, int z}) point1 = (x: 1, y: 2, z: 3);
({int r, int g, int b}) color1 = (r: 1, g: 2, b: 3);

print(point == color); // Prints 'false'. Lint: Equals on unrelated types.
// Returns multiple values in a record:
(String name, int age) userInfo(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}

final json = <String, dynamic>{
  'name': 'Dash',
  'age': 10,
  'color': 'blue',
};

// Destructures using a record pattern with positional fields:
var (name, age) = userInfo(json);

/* Equivalent to:
  var info = userInfo(json);
  var name = info.$1;
  var age  = info.$2;
  
// */
// ({String name, int age}) userInfo;(Map<String, dynamic> json)
// // ···
// // Destructures using a record pattern with named fields:
// final (:name, :age) = userInfo(json);
}

var record = ('first', a: 2, b: true, 'last');
(int, int) swap((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

// (String, int) record1;

// record1 = ('A string', 123);

// ({int a, bool b}) record2;

// record = (a: 123, b: true);
({int a, int b}) recordAB = (a: 1, b: 2);
({int x, int y}) recordXY = (x: 3, y: 4);

(int a, int b) recordAB1 = (1, 2);
(int x, int y) recordXY1 = (3, 4);

({int x, int y}) recordAB23 = recordXY;