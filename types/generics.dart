void main() {
  var names = <String>[];
  names.addAll(['Seth', 'Kathy', 'Lars']);
  print(names is List<String>); // true
  var foo = Foo();
  print(foo); // Instance of 'Foo<SomeBaseClass>'
}

abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

var names = <String>['Seth', 'Kathy', 'Lars'];
var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
var pages = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machines'
};

var nameSet = Set<String>.from(names);
var views = Map<int, View>();

class View {}

class Foo<T extends Object> {}

class Foo1<T extends SomeBaseClass> {
  String toString() => "Instance of 'Foo<$T>'";
}

var someBaseClassFoo = Foo<SomeBaseClass>();
var extenderFoo = Foo<Extender>();

class SomeBaseClass {}

class Extender extends SomeBaseClass {}

T first<T>(List<T> ts) {
  T tmp = ts[0];

  return tmp;
}
